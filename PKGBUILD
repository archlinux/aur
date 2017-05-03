# Maintainer: Eugene Dvoretsky <radioxoma at gmail dot com>

pkgname=python2-pylibtiff-git
pkgver=r138.33735eb
pkgrel=1
pkgdesc="A python wrapper of the C libtiff library"
arch=('i686' 'x86_64')
url="https://github.com/pearu/pylibtiff"
license=('BSD')
depends=('python2-numpy' 'libtiff')
makedepends=('python2-setuptools' 'git')
provides=('python2-libtiff' 'python2-pylibtiff')
replaces=('python2-libtiff-svn')
source=("${pkgname%-git}::git+https://github.com/pearu/pylibtiff.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/python2-pylibtiff
    python2 setup.py build

    # Don't care about "ImportError: No module named tif_lzw"
    python2 -c "from libtiff import TIFF" || true
}

package() {
    cd $srcdir/python2-pylibtiff
    python2 setup.py install --root="$pkgdir" --optimize=1
}
