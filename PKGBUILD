# Maintainer: Frederic Van Assche <frederic at fredericva.com>
pkgname=python-pylibtiff-git
pkgver=r125.e56519a
pkgrel=1
pkgdesc="A python wrapper of the C libtiff library"
arch=('any')
url="https://github.com/pearu/pylibtiff"
license=('custom')
depends=('python-numpy' 'libtiff')
makedepends=('python-setuptools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/pearu/pylibtiff.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/pylibtiff
    python setup.py build
}

package() {
    cd $srcdir/pylibtiff
    python setup.py install --root="$pkgdir" --optimize=1 
}
