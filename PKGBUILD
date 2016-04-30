# Maintainer: Henry de Valence <hdevalence@hdevalence.ca>
pkgname=libstxxl
pkgver=1.4.1
pkgrel=1
pkgdesc="Standard Template Library for Extra Large Data Sets"
arch=('i686' 'x86_64')
url="http://stxxl.sourceforge.net/"
license=('custom:Boost')
depends=('gcc-libs-multilib')
source=("https://github.com/stxxl/stxxl/releases/download/1.4.1/stxxl-1.4.1.tar.gz")
md5sums=('78a3957f604f2946b5425abadeb364ac')
options=(staticlibs)

build() {
	cd "$srcdir/stxxl-$pkgver"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
	make
}

package() {
	cd "$srcdir/stxxl-$pkgver/build"
	make DESTDIR="$pkgdir/" install
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp ../LICENSE_1_0.txt "$pkgdir/usr/share/licenses/$pkgname/"
}
