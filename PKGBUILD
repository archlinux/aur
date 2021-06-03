# Maintainer: Brett Dutro <brett.dutro@gmail.com>
pkgname=gstfs-ng
pkgver=1.1
pkgrel=5
pkgdesc="A FUSE-based file system for dynamic gstreamer-based transcoding"
arch=('x86_64')
url="https://github.com/rtyle/gstfs-ng"
license=('LGPL3')
depends=('fuse' 'boost' 'boost-libs' 'gstreamer')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rtyle/gstfs-ng/archive/$pkgver.tar.gz"
        "0001-call-good-explicitly-on-ostream.patch"
        "boost_system.patch"
        "boost_placeholder.patch"
        "cpp98.patch")
sha256sums=('44a40290adf8ee944ad4e108dafd9ad7eeed1846221ab0562025677dea6a2559'
            '65fe56b6f0e199ae72f60ca98559a6c93e865f72985d88a1a13f05d40551091d'
            '075f0b80dde207bc16e8b0498aef52e10ebbcbd4b76c2b3394b1bc2446ae4124'
            '1fb4bc7d19b23348422d36a836fc8015f1b2848168506c67da5fd70c6ade2205'
            '290a5a31597a77e0279440b0aa8ac8030d76344ef7c68091728e5dab6604aba8')

prepare() {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir/0001-call-good-explicitly-on-ostream.patch"
    patch -p1 -i "$srcdir/boost_system.patch"
    patch -p1 -i "$srcdir/boost_placeholder.patch"
    patch -p1 -i "$srcdir/cpp98.patch"
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
