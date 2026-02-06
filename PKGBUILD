# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-typing-inspect
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc='Runtime inspection utilities for typing module'
arch=('any')
url='https://github.com/ilevkivskyi/typing_inspect'
license=('MIT')
depends=(
  'python'
  'python-mypy_extensions'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
source=("${_name}::git+${url}.git#tag=$pkgver")
sha512sums=('9e33e5e03f6bb69f41207ea46ad9d7adbbe326314ddfe090b0dd0c2f48efe07e05e8a4a545653109348f5f8ff9c77e6146ca52f0e68c1e5a169f3366b1a624a0')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
}

build() {
    cd "${srcdir}/${_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
