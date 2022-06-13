# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-pytest-runner'
_name="${pkgname#python2-}"
pkgver=5.2
pkgrel=5
pkgdesc='Invoke py.test as distutils command with dependency resolution'
arch=('any')
license=('MIT')
url="https://pypi.org/project/${_name}/${pkgver}/"
depends=('python2-pytest')
makedepends=(
  'python2-pytest'
  'python2-setuptools-scm'
)
# # disable tests as they were only used for Python 3 and python2- dependencies for that are missing
# checkdepends=(
#   'python-pytest-black'
#   'python-pytest-cov'
#   'python-pytest-virtualenv'
#   'python-pytest-flake8'
# )
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/pytest-dev/pytest-runner/archive/$pkgver.tar.gz")
# # disable tests as they were only used for Python 3 and python2- dependencies for that are missing
# source+=("${_name}-black-fix.patch::https://github.com/pytest-dev/pytest-runner/commit/18b8fa1ace1b4ac0dbd53e14940da27c10db650d.patch")
b2sums=('0241c40b6a51c149a2e52e09fa9c16bbe26177a68c5c51f578008d79036b3bed3756fc6a8f15233030f7339b36b8a6562feb22acb65aaa44156ca1c9d8f54def')

# prepare() {
#   # disable tests as they were only used for Python 3 and python2- dependencies for that are missing
#   patch -d "${_tarname}" -p1 < "${_name}-black-fix.patch" || :
# }

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"

  cd "${_tarname}"
  python2 setup.py build
}

# # disable tests as they were only used for Python 3 and python2- dependencies for that are missing
# check() {
#   cd "${_tarname}"
#   python setup.py egg_info
#   PYTHONPATH="${PWD}" pytest
# }

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
