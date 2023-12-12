# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-php
epoch=2
pkgver=4.30
pkgrel=1
_release=2023-12/R
pkgdesc="Highly extensible IDE (PHP version)"
arch=(x86_64)
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-runtime>=17' webkit2gtk unzip)
makedepends=()
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)

_srcfilename="$pkgname-${_release//\//-}-linux-gtk-$CARCH.tar.gz"
source=("$_srcfilename::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename&r=1"
        "eclipse.desktop")
sha512sums=('2abca8766a0440fe659880b6f790894dcfc187cedb5d3462a99fc2ff607b1aecbf77214cf759d82425f23932a1401d00a803dead6f572c829d2c17f8a8070cb1'
            '910d235d1b170b850d91598af1949db5109671236d76f62ea51f9505a285b4b10fcdacae0bc60dc209ab57fbb44d98223fb4b584b31e220253396a933bc98a78')

#backup=('usr/lib/eclipse/eclipse.ini')

package() {
    install -d "${pkgdir}/usr/lib"
    cp -r "eclipse" "${pkgdir}/usr/lib/eclipse"
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/lib/eclipse/eclipse" "${pkgdir}/usr/bin/eclipse"

    install -Dm644 "eclipse.desktop" "${pkgdir}/usr/share/applications/eclipse.desktop"

    for i in 16 22 24 32 48 64 128 256 512 1024 ; do
        install -Dm644 eclipse/plugins/org.eclipse.platform_${pkgver}*/eclipse$i.png \
            "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/eclipse.png"
    done
}
