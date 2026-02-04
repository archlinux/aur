# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-apeye
_name=${pkgname#python-}
pkgver=1.4.1
pkgrel=2
pkgdesc="Handy tools for working with URLs and APIs"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://apeye.readthedocs.io/"
depends=(
  'python'
  'python-apeye-core'
  'python-domdf-python-tools'
  'python-platformdirs'
  'python-requests'
)
makedepends=(
    git
    'python-build'
    'python-flit-core'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
  'python-cachecontrol: rate limiting'
  'python-lockfile: rate limiting'
  'python-ruamel-yaml: yaml serializer'
  'python-pyaml: yaml serializer'
)
license=('MIT')
source=("${_name}::git+https://github.com/domdfcoding/apeye.git#tag=v$pkgver")
sha512sums=('c3d5c232904ebe45c5e491390fe6862b59372166c602a7b4daa4b0922c1fe8108c6db93d7f2369f95e30d29c671f2a225eb866b0a96bc7eb1796acefb61259f2')

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
