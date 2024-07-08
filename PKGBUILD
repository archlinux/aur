# Maintainer: Karim Vergnes <me@thesola.io>

pkgname=intel-ipu6-dkms-git
_pkgname=ipu6-drivers
pkgver=r187.aecec2aae
pkgrel=1
pkgdesc="Intel IPU6 camera drivers (DKMS)"
arch=('any')
url="https://github.com/intel/${_pkgname}"
license=('unknown')
depends=('dkms' 'intel-ivsc-firmware')
provides=('intel-ivsc-driver-dkms-git')
conflicts=('intel-ivsc-driver-dkms-git')
makedepends=('git')
source=("git+${url}")
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
