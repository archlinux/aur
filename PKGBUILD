# Contributor: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=canmatrix-git
pkgver=1.2.r76.ge063926
pkgrel=1
pkgdesc='Utility for converting CAN database formats'
arch=('any')
url='https://github.com/ebroecker/canmatrix'
license=('BSD')
depends=(
    'python' 'python-lxml' 'python-xlwt' 'python-xlrd'
    'python-yaml' 'python-attrs' 'python-click'
)
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools')
source=("git+https://github.com/ebroecker/canmatrix.git")
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/canmatrix
    git describe --long 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/canmatrix
    python -m build --wheel --no-isolation
    python -m installer --destdir="$pkgdir" dist/*.whl
}

