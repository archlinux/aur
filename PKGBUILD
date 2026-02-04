# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-consolekit
_name=${pkgname#python-}
pkgver=1.12.0
pkgrel=1
pkgdesc='Additional utilities for click'
arch=(any)
url='https://consolekit.readthedocs.io/'
license=(MIT)
depends=(
  python
  python-click
  python-colorama
  python-deprecation-alias
  python-domdf-python-tools
  python-mistletoe
  python-typing_extensions
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-flit-core
)
optdepends=(
  'python-psutil: better terminal support'
)
source=("$_name::git+https://github.com/domdfcoding/consolekit#tag=v$pkgver")
sha512sums=('4d948742b6ef04dc53296f0aaf69c1e8e63412ee73382f33f67cc697733fd70ed9c70c58b2e4bb4095cd54d576c0f70e80659aa760cc98817045ac729c2a008f')

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
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
