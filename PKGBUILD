pkgname=nullfs-dkms-git
pkgver=0.14.r0.gd1b683f
pkgrel=1
pkgdesc='A virtual black hole file system that behaves like /dev/null (DKMS)'
arch=('x86_64')
url='https://github.com/abbbi/nullfsvfs'
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=('nullfs-dkms')
provides=('nullfs')
source=('git+https://github.com/abbbi/nullfsvfs.git')
sha512sums=('SKIP')

pkgver() {
    cd nullfsvfs
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    sed -i "s/#MODULE_VERSION#/$pkgver/" nullfsvfs/debian/nullfsvfs.dkms
}

package() {
    cd nullfsvfs
    install -Dm644 debian/nullfsvfs.dkms "$pkgdir/usr/src/nullfs-$pkgver/dkms.conf"
    install -Dm644 Makefile nullfs.c -t "$pkgdir/usr/src/nullfs-$pkgver"
}
