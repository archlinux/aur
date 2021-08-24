# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-php
epoch=2
pkgver=4.20
pkgrel=1
_release=2021-06/R
pkgdesc="Highly extensible IDE (PHP version)"
arch=(x86_64)
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-environment>=11' webkit2gtk unzip)
makedepends=()
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)

_srcfilename="$pkgname-${_release//\//-}-linux-gtk-$CARCH.tar.gz"
source=("$_srcfilename::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename&r=1"
        "eclipse.desktop")
sha512sums=('0e5251f74222deda86a5340c10c4d7c9b56efa3fe19ef82f1aa7515ca6721a8c70b8aa704ea6d1a22f04af5076549ef163c1d37c6b6fc15a5374b85aa15bd950'
            '910d235d1b170b850d91598af1949db5109671236d76f62ea51f9505a285b4b10fcdacae0bc60dc209ab57fbb44d98223fb4b584b31e220253396a933bc98a78')

package() {
    install -d "${pkgdir}/usr/lib"
    cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"

    install -Dm644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"

    for i in 16 22 24 32 48 64 128 256 512 1024 ; do
        install -Dm644 eclipse/plugins/org.eclipse.platform_*/eclipse$i.png \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
    done
}
