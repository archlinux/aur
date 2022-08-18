# Maintainer: Carson Rueter <roachh@protonmail.com>

pkgname='denise-bin'
_pkgname='denise'
pkgdesc='Highly accurate C64/Amiga emulator - binary release'
url='https://sourceforge.net/projects/deniseemu/'
license=('GPL')
pkgver=1.1.3.1
pkgrel=1
_filename="${_pkgname}_ubuntu2004_v${pkgver}"
source=("https://sourceforge.net/projects/deniseemu/files/v%20${pkgver}/${_filename}.tar.gz")
sha256sums=('1a2c814d19d3f6275f1c724b5d4a8204b24f6d10ea6a5a3b478a2d4205cf696a')
provides=('denise')
conflicts=('denise-git' 'denise')
depends=('sdl2' 'gtk3')
arch=('i686' 'x86_64')

prepare() {
  sed -i 's/Exec=Denise/Exec=denise/g' "$srcdir/$_filename/denise.desktop"
}
package() {
  cd "$srcdir/$_filename"
  mkdir -p $pkgdir/usr/bin/
  mkdir -p $pkgdir/usr/share/icons/
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/lib/$_pkgname/translation/
  mkdir -p $pkgdir/usr/lib/$_pkgname/data/
  mkdir -p $pkgdir/usr/lib/$_pkgname/fonts/
  mkdir -p $pkgdir/usr/lib/$_pkgname/img/
  mkdir -p $pkgdir/usr/lib/$_pkgname/shader/

  install -Dm755 denise $pkgdir/usr/bin/$_pkgname
  install -Dm644 $_pkgname.png $pkgdir/usr/share/icons/
  install -Dm644 $_pkgname.desktop $pkgdir/usr/share/applications/
  install -Dm644 translation/* $pkgdir/usr/lib/$_pkgname/translation/
  install -Dm644 data/* $pkgdir/usr/lib/$_pkgname/data/
  install -Dm644 fonts/* $pkgdir/usr/lib/$_pkgname/fonts/
  install -Dm644 img/startscreen.png $pkgdir/usr/lib/$_pkgname/img/
  cp -r shader $pkgdir/usr/lib/$_pkgname/
}
