# Maintainer: Arnaud Renevier <arno@renevier.net>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=actdiag
pkgver=3.1.0
pkgrel=1
pkgdesc="Generate activity-diagram image files from spec-text files."
arch=(any)
url="http://blockdiag.com/en/actdiag"
license=('Apache-2.0')
depends=('python' 'blockdiag>=3.1.0' 'python-funcparserlib')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-docutils' 'python-pytest' 'python-pycodestyle' 'python-reportlab')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/arenevier/actdiag/archive/v$pkgver.tar.gz"
)
sha512sums=('95b82dee00bd09c40b80857fa477b83bed9d20ab59af7b69ea5b75ba08d5fca73d5323b0e6feecd01e81cb7edd96eef90ec9dce85d97778af42df7d617a16e35')

build() {
  cd actdiag-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd actdiag-$pkgver
  PYTHONDONTWRITEBYTECODE=1 pytest
}

package() {
  cd actdiag-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
