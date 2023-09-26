# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.1.11
pkgrel=1
pkgdesc="Optimized HTTP server with support for HTTP/1.x and HTTP/2"
arch=('i686' 'x86_64' 'aarch64')
depends=()
makedepends=('cmake' 'libtool' 'make')
url="https://github.com/jedisct1/libaegis.git"
license=('MIT')
options=('lto')

_commit=54e16f8aef4769c7e1e10149b8532a72f1771f04
source=("git+https://github.com/jedisct1/libaegis.git?commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('SKIP')
provides=('libaegis')
conflicts=('libaegis')

pkgver() {
	cd "$srcdir/$pkgname"
        git describe --tags | sed -e 's/^v//g' -e 's/-g.*$//g' -e 's/-.*//g'
}

build() {
	cd "$srcdir/$pkgname"

        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr/ -DFAVOR-PERFORMANCE=1 ..
        make
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        cd build
	make DESTDIR="$pkgdir" install
}
