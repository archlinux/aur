# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=wattpdl
_name=wattpdl
pkgver=1.5.0
pkgrel=2
pkgdesc='Download Wattpad stories as offline .txt/.docx/.epub/.md/.pdf files with a Rich CLI'
arch=('any')
url='https://github.com/nekonaru/wattpdl'
license=('MIT')
depends=(
  'python>=3.9'
  'python-requests'
  'python-rich'
  'python-docx'
  'python-ebooklib'
  'python-reportlab'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
  'python-responses'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
# Run `updpkgsums` to fill this in after editing pkgver
sha256sums=('SKIP')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}"
  PYTHONPATH=src python -m pytest tests/ -v
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
