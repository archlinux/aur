# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-jinja2
_name=${pkgname#python-}
pkgver=3.1.6
pkgrel=1
pkgdesc='A very fast and expressive template engine'
arch=('any')
url='https://github.com/pallets/jinja'
license=('MIT')
depends=(
  'python'
  'python-markupsafe'
  'python-typing_extensions'
)
makedepends=(
  'git'
  'python-flit-core'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=()
source=("${_name}::git+${url}.git#tag=$pkgver")
sha512sums=('f5c81462b5ce26327d1f34378178d81b251e9e46e7a936a1b7e82ef86b20a7e2a08a812a6d65d7dee278381221eddc790a5afa9ce60b505f67b7b467a49926d4')

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
    install -Dm0644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
