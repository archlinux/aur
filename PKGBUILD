# Maintainer: taotieren <admin@taotieren.com>

pkgname=netscripts-atzlinux-git
pkgver=9d3542c
pkgrel=1
pkgdesc="some simple network scripts no need any parameter"
arch=("any")
groups=()
depends=('git' 'curl' 'iftop' 'net-tools' 'iproute2' 'gawk')
makedepends=()
optdepends=()
conflicts=()
url="https://www.atzlinux.com"
license=('GPL3')
options=(!strip)
install=${pkgname}.install
source=("git+https://gitee.com/atzlinux/netscripts-atzlinux.git"
    "${pkgname}.install")
sha256sums=('SKIP'
    'e656428849ba60442d2bb501d4f4055eab0962f3e9ede8a5f39f9ffa8c546bc0')

pkgver()
{
    cd "${srcdir}/netscripts-atzlinux/"
    git describe --always | sed 's|-|.|g'
}

package() {
	cd "$srcdir"
    cp -r "${srcdir}/netscripts-atzlinux/usr" "${pkgdir}/"
    install -Dm644 "${srcdir}/netscripts-atzlinux/debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -sf "/usr/bin/localip" "${pkgdir}/usr/bin/lip"
    ln -sf "/usr/bin/localip" "${pkgdir}/usr/bin/lanip"
    ln -sf "/usr/bin/wanip" "${pkgdir}/usr/bin/wip"
    ln -sf "/usr/sbin/iftopgw" "${pkgdir}/usr/sbin/iftopg"
    ln -sf "/usr/sbin/iftopbluetooth" "${pkgdir}/usr/sbin/iftopb"
}

#
# makepkg --printsrcinfo > .SRCINFO
#
