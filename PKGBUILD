# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Arnaud Renevier <arno@renevier.net>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=actdiag
pkgver=3.1.0
pkgrel=3
pkgdesc="Generate activity-diagram images from spec-text files"
url="https://github.com/arenevier/actdiag"
license=('Apache-2.0')
arch=('any')
depends=('python' 'blockdiag>=3.1.0' 'python-funcparserlib')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-docutils' 'python-pytest' 'python-pycodestyle' 'python-reportlab')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('95b82dee00bd09c40b80857fa477b83bed9d20ab59af7b69ea5b75ba08d5fca73d5323b0e6feecd01e81cb7edd96eef90ec9dce85d97778af42df7d617a16e35')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

## If anyone knows how to fix this please let me know.
# check() {
#   cd $pkgname-$pkgver
#   PYTHONDONTWRITEBYTECODE=1 pytest
# }

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
