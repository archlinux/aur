# Maintainer: Karim Vergnes <me@thesola.io>

pkgname=intel-ipu6-dkms-git
_pkgname=ipu6-drivers
pkgver=r55.095a2440a
pkgrel=1
pkgdesc="Intel IPU6 camera drivers (DKMS)"
arch=('any')
url="https://github.com/intel/ipu6-drivers"
license=('unknown')
depends=('dkms')
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
