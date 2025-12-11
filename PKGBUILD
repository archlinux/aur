# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-php-bin
_pkgname=${pkgname%-bin}
epoch=2
pkgver=4.38
pkgrel=1
_release=2025-12/R
pkgdesc="Highly extensible IDE (PHP version)"
arch=('x86_64' 'aarch64')
url="https://www.eclipse.org/"
license=('EPL')
depends=('java-runtime>=21' webkit2gtk unzip)
makedepends=()
provides=(eclipse=$pkgver-$pkgrel)
conflicts=(eclipse)
options=(!strip)

_srcfilename_x86_64="$_pkgname-${_release//\//-}-linux-gtk-x86_64.tar.gz"
_srcfilename_aarch64="$_pkgname-${_release//\//-}-linux-gtk-aarch64.tar.gz"

source_x86_64=("$_srcfilename_x86_64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_x86_64&r=1")
source_aarch64=("$_srcfilename_aarch64::https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/$_release/$_srcfilename_aarch64&r=1")

sha512sums_x86_64=('2b407e758ee8bef90e09a23ce385557c6f2e3c58c5997982e970fe205c53b28f3f1bdbd395b428cf57c02fbfbc7fa9e0d384131648147f77cb4198cad34314c2')
sha512sums_aarch64=('8ab0dd908092c45442bce5bc2d0ef20ca91c585dc512ddd16688439113cb96c5835057e0135f721d07597492b081f684bf99c835fb61c5c0d67edfe47fce12b8')

source=("eclipse.desktop")
sha512sums=('910d235d1b170b850d91598af1949db5109671236d76f62ea51f9505a285b4b10fcdacae0bc60dc209ab57fbb44d98223fb4b584b31e220253396a933bc98a78')

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
