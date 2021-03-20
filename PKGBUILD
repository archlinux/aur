# Maintainer: Brett Dutro <brett.dutro@gmail.com>
pkgname=gstfs-ng
pkgver=1.1
pkgrel=3
pkgdesc="A FUSE-based file system for dynamic gstreamer-based transcoding"
arch=('x86_64')
url="https://github.com/rtyle/gstfs-ng"
license=('LGPL3')
depends=('fuse' 'boost' 'boost-libs' 'gstreamer')
source=("https://github.com/rtyle/gstfs-ng/archive/$pkgver.tar.gz"
        "gcc6-fix.patch"
        "boost_system.patch"
        "boost_placeholder.patch")
sha256sums=('44a40290adf8ee944ad4e108dafd9ad7eeed1846221ab0562025677dea6a2559'
            '1e2d04cdf6803109cb11112c2a7a4bd0be8a4557999279cfab2fdb8d7f8ce9ad'
            '075f0b80dde207bc16e8b0498aef52e10ebbcbd4b76c2b3394b1bc2446ae4124'
            '1fb4bc7d19b23348422d36a836fc8015f1b2848168506c67da5fd70c6ade2205')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/gcc6-fix.patch"
	patch -p1 -i "$srcdir/boost_system.patch"
	patch -p1 -i "$srcdir/boost_placeholder.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    install -D gstfs-ng.8 "${pkgdir}"/usr/share/man/man8/gstfs-ng.8
    install -D gstfs-ng.monitor "${pkgdir}"/usr/bin/gstfs-ng.monitor
    install -D gstfs-ng "${pkgdir}"/usr/bin/gstfs-ng
    ln -s /usr/bin/gstfs-ng "${pkgdir}"/usr/bin/mount.gstfs-ng
}
