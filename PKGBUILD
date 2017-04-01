# Maintainer: Brett Dutro <brett.dutro@gmail.com>
pkgname=gstfs-ng
pkgver=1.1
pkgrel=1
pkgdesc="A FUSE-based file system for dynamic gstreamer-based transcoding"
arch=('x86_64')
url="https://github.com/rtyle/gstfs-ng"
license=('LGPL3')
depends=('fuse' 'boost' 'boost-libs' 'gstreamer')
source=("https://github.com/rtyle/gstfs-ng/archive/$pkgver.tar.gz"
        "gcc6-fix.patch"
        "boost_system.patch")
md5sums=('e49bedd78f3ab5d9838c7e073dc1a35e'
         'b4104b2ca5b5ac3bbd70c7a6c7816b6b'
         '44866af1ff5ee83de2a7e14d589a39ed')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/gcc6-fix.patch"
	patch -p1 -i "$srcdir/boost_system.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
    install -D gstfs-ng.8 "${pkgdir}"/usr/share/man/man8/gstfs-ng.8
    install -D gstfs-ng.monitor "${pkgdir}"/usr/bin/gstfs-ng
    install -D gstfs-ng "${pkgdir}"/usr/bin/gstfs-ng
    ln -s /usr/bin/gstfs-ng "${pkgdir}"/usr/bin/mount.gstfs-ng
}
