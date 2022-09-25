# Maintainer: Ulrich Huber <ulrich@huberulrich.de>

pkgbase=ideapad-wmi-fn-keys
pkgname=${pkgbase}-dkms-git
pkgver=r4.fb2a17f
pkgrel=1
pkgdesc="Kernel module for Ideapad fn key detection"
arch=('x86_64')
url="https://github.com/LittleHuba/${pkgbase}"
license=('GPL')
makedepends=('git')
depends=('dkms')
source=("git+https://github.com/LittleHuba/${pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/${pkgbase}"
    install -Dt "$pkgdir/usr/src/${pkgbase}-$pkgver" -m644 Makefile ideapad-wmi-fn-keys.c dkms.conf
    sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
    echo "${pkgbase}" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/${pkgbase}.conf"
}
