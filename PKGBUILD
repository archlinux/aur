# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-consolekit
_name=${pkgname#python-}
pkgver=1.13.0
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
sha512sums=('c1cc9c4ac0b530638ca97cb0a2ea07a483ca25c2ac3c227a12bd1370d805a5dc760e0a838ed6081ffb740ca4751b8b84a31ae45c7f919a380c448d2c3f427944')

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
