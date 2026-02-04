# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-deprecation-alias
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=2
pkgdesc='A wrapper around deprecation providing support for deprecated aliases'
arch=(any)
url='https://github.com/domdfcoding/deprecation-alias'
license=(Apache-2.0)
depends=(
    python
    python-deprecation
    python-packaging
)
makedepends=(
  git
  python-build
  python-installer
  python-wheel
  python-setuptools
  python-hatchling
  python-hatch-requirements-txt
)
source=("$_name::git+$url#tag=v$pkgver")
sha512sums=('0574311323b03f0b07734dc3d9ef6e5b26c4b1bab1181473f78cf83f463a36b65d4a1ece37c6b12461263ed6ba5607717b4590443738bb656e8caf28b0163351')

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
