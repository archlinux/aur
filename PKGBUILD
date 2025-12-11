# Maintainer: Mattia Moffa <mattia [at] moffa [dot] xyz>

pkgname=eclipse-jee-bin
_pkgname=${pkgname%-bin}
epoch=2
pkgver=4.38
pkgrel=1
_release=2025-12/R
pkgdesc="Highly extensible IDE (Enterprise Java and Web version)"
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

sha512sums_x86_64=('c9a48e7802c7609e93d6b4192d1c0833bee9b28c66411a9f46c15c149134977b009299e9ef9bcb7802dac4c24d3e8d38a5650eb01a138dad0aea71285505e87c')
sha512sums_aarch64=('9aecb7099dc759fc4883896102f49974dbcd62265633e7c19963534f36e4e22c625065910ac48008354689179487e58acf1327bfb4f97bd2a7d9da72c8a85127')

source=("eclipse.desktop")
sha512sums=('9da29da1fe9e4ac4b8f1a4faef158155399574752a317addf90f6a068019ad62906f8ce1db11e543c7fee7dbf3dd8273aa34fc86ff2354420371cdf9b017cdf3')

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
