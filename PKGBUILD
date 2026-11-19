# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=wattpdl
_name=wattpdl
pkgver=1.10.0
pkgrel=1
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
sha256sums=('dec89cb5fe5fb20c987fc624a7c39ea7fc9821b3f0f63242eb5a7e701052062a')

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
