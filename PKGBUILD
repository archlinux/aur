# Maintainer: hexchain <arch at hexchain dot org>

_pkgbase=apple-ib-drv
pkgname=${_pkgbase}-dkms-git
pkgver=r305.fc9aefa
pkgrel=1
pkgdesc="Apple iBridge devices support (Touchbar/ALS) for MacBook Pro 2018 and onward"
url="https://github.com/t2linux/apple-ib-drv"
license=('GPL2')
arch=('x86_64')
groups=('apple-t2')
depends=('dkms' 'pahole')
source=("git+https://github.com/t2linux/apple-ib-drv#branch=mbp15")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "$_pkgbase"

    install -dm755 "$pkgdir/usr/src/$_pkgbase-$pkgver"
    cp -rv --no-preserve=ownership * "$pkgdir/usr/src/$_pkgbase-$pkgver/"
}
