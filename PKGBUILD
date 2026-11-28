# Maintainer: Kaan Gültekin <kaan[at]kaangultekin[dot]net>
#
# Generated from packaging/aur/PKGBUILD in https://github.com/GamehunterKaan/AutoPWN-Suite
# by .github/workflows/publish-aur.yml, which fills in the version and the PyPI sdist digest.
# Send changes there as a pull request; edits pushed only to the AUR are overwritten.

pkgname=python-autopwn-suite
_name=autopwn_suite
pkgver=2.10.0
pkgrel=1
pkgdesc="Automated vulnerability scanning and exploitation tool"
arch=('any')
url="https://github.com/GamehunterKaan/AutoPWN-Suite"
license=('Apache-2.0')
depends=(
  'nmap'
  'python'
  'python-beautifulsoup4'
  'python-cryptography'
  'python-distro'
  'python-flask'
  'python-flask-cors'
  'python-requests'
  'python-rich'
  'python-urllib3'
  'python-werkzeug'
)
makedepends=('python-build' 'python-installer' 'python-poetry-core')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('23362521d1bb428e1c301eeaa17d767fe242f47b344359bd91fbd9a19cccb22c')

build() {
  cd "${_name}-${pkgver}"
  # The project pins its build backend exactly; build with Arch's poetry-core instead.
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
