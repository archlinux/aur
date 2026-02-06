# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-coincidence
_name=${pkgname#python-}
pkgver=0.6.6
pkgrel=1
pkgdesc='Helper functions for pytest'
arch=('any')
url='https://github.com/python-coincidence/coincidence'
license=('MIT')
depends=(
  'python'
  python-domdf-python-tools
  'python-pytest'
  'python-pytest-regressions'
  'python-toml'
  'python-typing_extensions'
)
makedepends=(
  'git'
  python-whey
  'python-build'
  'python-license-expression'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha512sums=('020fcfc06a30f3b1416c255a94faec5feacc58dbed194d3146235da74d72db78f125da433140060e992e25a02e57ea0fb0ce517b49d3282a86b3997ae9cf0295')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m whey --wheel
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
