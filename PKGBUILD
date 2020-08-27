# Maintainer: Frederic Van Assche <frederic at fredericva.com>
# Contributor: Eugene Dvoretsky <radioxoma at gmail dot com>

pkgname=python-pylibtiff-git
pkgver=r218.51d6f2a
pkgrel=1
pkgdesc="A python wrapper of the C libtiff library"
arch=('i686' 'x86_64')
url="https://github.com/pearu/pylibtiff"
license=('BSD')
depends=('python-numpy' 'libtiff')
makedepends=('python-setuptools' 'git')
provides=('python-libtiff' 'python-pylibtiff')
replaces=('python-libtiff-svn')
source=("${pkgname%-git}::git+https://github.com/pearu/pylibtiff.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/python-pylibtiff
	python setup.py build

	# Don't care about "ImportError: No module named tif_lzw"
	python -c "from libtiff import TIFF" || true
}

package() {
	cd $srcdir/python-pylibtiff
	python setup.py install --root="$pkgdir" --optimize=1
}
