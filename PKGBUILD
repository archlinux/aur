# Maintainer: taotieren <admin@taotieren.com>

pkgname=netscripts-atzlinux-git
pkgver=1.0.9.r0.ga802eb5
pkgrel=6
pkgdesc="some simple network scripts no need any parameter"
arch=("any")
groups=()
depends=('git' 'curl' 'iftop' 'net-tools' 'iproute2' 'gawk')
makedepends=()
optdepends=()
conflicts=()
url="https://www.atzlinux.com"
license=('GPL-3.0-only')
options=()
install=${pkgname}.install
source=("git+https://gitee.com/atzlinux/netscripts-atzlinux.git"
    "${pkgname}.install")
sha256sums=('SKIP'
            '6067b7e16b3c8193729e9620983c183de05d12d6f669d05cb2af591a52e5adea')

pkgver()
{
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's|^debian/||g;s|atzlinux/||g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm644 "${srcdir}/netscripts-atzlinux/debian/copyright" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    cp -r "${srcdir}/netscripts-atzlinux/usr/bin" "${pkgdir}/usr"
    cp -r "${srcdir}/netscripts-atzlinux/usr/sbin/." "${pkgdir}/usr/bin"

    ln -sf "/usr/bin/localip" "${pkgdir}/usr/bin/lip"
    ln -sf "/usr/bin/localip" "${pkgdir}/usr/bin/lanip"
    ln -sf "/usr/bin//wanip" "${pkgdir}/usr/bin/wip"
    ln -sf "/usr/bin/iftopgw" "${pkgdir}/usr/bin/iftopg"
    ln -sf "/usr/bin/iftopbluetooth" "${pkgdir}/usr/bin/iftopb"

}

#
# makepkg --printsrcinfo > .SRCINFO
#
