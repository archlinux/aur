# Maintainer: Lukas W. <lukaswhl at gmail dot com>

pkgbase=yoga-usage-mode
pkgname=(yoga-usage-mode-dkms-git)
pkgver=r8.3ada633
pkgrel=1
pkgdesc="Kernel module for Yoga C940 tablet mode detection"
arch=('x86_64')
url="https://github.com/lukas-w/yoga-usage-mode"
license=('MIT')
makedepends=('git')
source=('git+https://github.com/lukas-w/yoga-usage-mode.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgbase}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_yoga-usage-mode-dkms-git() {
    depends=(dkms)
    provides=("yoga-usage-mode=$pkgver-$pkgrel")
    conflicts=(yoga-usage-mode)

    cd "$srcdir/${pkgbase}"
    install -Dt "$pkgdir/usr/src/$pkgbase-$pkgver" -m644 Makefile yoga-usage-mode.c "$srcdir/../dkms.conf"
    echo yoga-usage-mode | install -Dm644 /dev/stdin "$pkgdir/usr/lib/modules-load.d/$pkgbase.conf"
}
