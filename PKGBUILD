# Maintainer: Yamada Hayao <shun819.mail@gmail.com,>
# Contributer: Karim Vergnes <me@thesola.io>

pkgname=intel-ipu7-dkms-git
_pkgname=ipu7-drivers
pkgver=r42.62a3704
pkgrel=1
pkgdesc="Intel IPU7 camera drivers (DKMS)"
arch=('any')
url="https://github.com/intel/${_pkgname}"
license=('unknown')
depends=('dkms' 'intel-ivsc-firmware')
provides=('intel-ivsc-driver-dkms-git' 'intel-ipu7-dkms')
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
