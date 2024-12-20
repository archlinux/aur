# Maintainer: d10n <david at bitinvert dot com>

pkgname=subscription-manager-rhsm-certificates-git
_name=${pkgname%-git}
pkgver=20220623.1.r18.g70318f1
pkgrel=1
pkgdesc='Certificates for Red Hat Subscription Management'
arch=(any)
url='https://github.com/candlepin/subscription-manager-rhsm-certificates/'
provides=(subscription-manager-rhsm-certificates)
makedepends=(git)
license=(GPL-2.0-only)
source=("git+https://github.com/candlepin/$_name.git")
b2sums=('SKIP')

pkgver() {
    cd "$_name"
    git describe --long --match='subscription-manager-rhsm-certificates-*' |
        sed 's/^subscription-manager-rhsm-certificates-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_name"
    make DESTDIR="$pkgdir" PREFIX=/ install
}

