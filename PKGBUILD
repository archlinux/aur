# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

_base=setuptools_scm_git_archive
pkgname=python-${_base//_/-}
pkgver=1.4.1
_commit=cfdcdc68f75621c5808726c15daff9e490ed6d07
pkgrel=1
pkgdesc="[DEPRECATED] setuptools-scm<7.0 plugin for git archives (use setuptools-scm>=7.0 instead)"
arch=('any')
url="https://github.com/Changaco/${_base}"
license=('MIT')
depends=('python-setuptools-scm<8')
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("git+${url}.git#commit=${_commit}")
b2sums=('SKIP')

build() {
  cd "${srcdir}/${_base}"
  (
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
  )
}

check() {
  cd "${srcdir}/${_base}"
  python tests.py
}

package() {
  cd "${srcdir}/${_base}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
