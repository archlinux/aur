# Maintainer: Jon Gjengset <jon@thesquareplanet.com>
pkgname=pygpu-git
pkgver=r1226.2d21cc2
pkgrel=1
pkgdesc="Python bindings for libgpuarray"
arch=('any')
url="https://github.com/Theano/libgpuarray"
license=('MIT')
depends=('python2' 'python2-mako' 'cython2')
makedepends=('git' 'libgpuarray')
optdepends=('python2-nose: for pygpu.test()')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Theano/libgpuarray.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libgpuarray"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/libgpuarray"
}

build() {
	cd "$srcdir/libgpuarray"
	python2 setup.py build_ext -L /usr/lib -I /usr/include
}

package() {
	cd "$srcdir/libgpuarray"
	install -d "$pkgdir/usr/lib/python2.7/site-packages"
	env PYTHONPATH="$pkgdir/usr/lib/python2.7/site-packages" python2 setup.py install "--prefix=$pkgdir/usr"
}
