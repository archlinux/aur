# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-hydra-slayer'
pkgname=('python-hydra-slayer')
_module='hydra-slayer'
pkgver='0.4.0'
pkgrel=1
pkgdesc="A framework for elegantly configuring complex applications"
url="https://catalyst-team.github.io/hydra-slayer/"
depends=('python' 'python-pyyaml')
makedepends=('python-setuptools' 'python-poetry' 'git')
checkdepends=('python-pytest')
license=('Apache')
arch=('any')
source=(
  "https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz"
  "${_module}-${pkgver}-git::git+https://github.com/catalyst-team/hydra-slayer.git#tag=0.4.0"
)
sha256sums=(
  '2e7ef0b99e5e11504d80996f689ed5ed7ae8766edb8e76b6933b306966159604'
  'SKIP'
)

build() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  python setup.py build
  # poetry build
}

package() {
  echo ">>> PACKAGE"
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
  cd "${srcdir}/${_module}-${pkgver}-git" || exit 1
  pytest -v tests
}
