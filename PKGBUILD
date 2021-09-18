# Maintainer: John-Michael Mulesa <jmulesa [at] gmail.com>

pkgname=dungeondefenders-hib
_pkgname=dungeondefenders
pkgver=03052013
pkgrel=1
arch=('i686' 'x86_64')
depends=()
makedepends=('unzip')
source=("${_pkgname}.sh" "${_pkgname}.desktop" "hib://dundef-linux-${pkgver}.mojo.run")
pkgdesc="Dungeon Defenders Linux-native with data via Humble Bundle"
license=('custom')
url='https://www.humblebundle.com/store/dungeon-defenders-collection'
sha256sums=('87f7777610ffe8355b7c08bd779b89f4703e49e5486688c1d8f26a6c016ccf2b'
            '099db209518621519045611c7f57ceb786cc8a51a046081e4958bb47d7e29ae1'
            'bc81021859871169285111ef7b1806952dcc17b128f3e387d9b5072918490c61')

prepare() {
  cd "${srcdir}"
  unzip -u "dundef-linux-${pkgver}.mojo.run" -d "${_pkgname}" || true
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}

    # Move required files to pkgdir
    cp -r $srcdir/${_pkgname}/data/* $pkgdir/opt/${_pkgname}/

    # Install desktop file.
    install -D -m 644 $srcdir/${_pkgname}.desktop \
             $pkgdir/usr/share/applications/${_pkgname}.desktop

    # Install icon file.
    install -D -m 644 $srcdir/${_pkgname}/data/*.png \
             $pkgdir/usr/share/pixmaps/${_pkgname}.png

    # Install bash startup script.
    install -D -m 755 $srcdir/${_pkgname}.sh \
             $pkgdir/usr/bin/${_pkgname}
}
