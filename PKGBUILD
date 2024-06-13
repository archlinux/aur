# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-php-bin
_pkgname=${pkgname%-bin}
epoch=2
pkgver=4.32
pkgrel=1
_release=2024-06/R
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

sha512sums_x86_64=('0bf9eddfbefa7ed7b183976171fad18e44c5b3086ce17a4cfb825ab4b78f8f39c3b2bbd0e639a51211d127bc61948dc3d111ece0abe38ab898e5021dbe6ec9cc')
sha512sums_aarch64=('3c75e42d392131ad691411f42ca2a0446dfc7a911111f89482e4dea2e049bbb787d645a2cc885b021b77b33ed9f216fc508e615d480f6a195d288083d22e8337')

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
