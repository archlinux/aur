# Maintainer: Karim Vergnes <me@thesola.io>

pkgname=intel-ivsc-driver-dkms-git
_pkgname=ivsc-driver
pkgver=r25.b8c22f4
pkgrel=1
pkgdesc="Intel Vision Sensing Controller driver (DKMS)"
arch=('any')
url="https://github.com/intel/ivsc-driver"
license=('unknown')
depends=('dkms' 'intel-ivsc-firmware')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -i "s/^PACKAGE_VERSION=\".*\"$/PACKAGE_VERSION=\"$pkgver\"/g" ./dkms.conf
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/src"
    cp -rT "$_pkgname" "$pkgdir/usr/src/$_pkgname-$pkgver"
}
