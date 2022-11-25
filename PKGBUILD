# Maintainer: Swapnil Devesh <me@sidevesh.com>

pkgbase=ideapad-wmi-usage-mode
pkgname=${pkgbase}-dkms-git
pkgver=r4.650b870
pkgrel=1
pkgdesc="Kernel module for Ideapad usage mode reported by the firmware"
arch=('x86_64')
url="https://github.com/sidevesh/${pkgbase}"
license=('GPL')
makedepends=('git')
depends=('dkms')
source=("git+https://github.com/sidevesh/${pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgbase}"
    install -Dt "$pkgdir/usr/src/${pkgbase}-$pkgver" -m644 Makefile ideapad-wmi-usage-mode.c dkms.conf
    sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
    echo "${pkgbase}" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/${pkgbase}.conf"
}
