# Maintainer: taotieren <admin@taotieren.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=pypika
pkgname="python-${_pkgname}"
pkgver=0.51.1
pkgrel=2
pkgdesc="A SQL query builder API for Python"
arch=("any")
url="https://github.com/kayak/${_pkgname}"
license=('Apache-2.0')
depends=(
    "python"
    "python-typing_extensions"
)
makedepends=(
    'git'
    'python-build' 
    'python-installer' 
    'python-setuptools' 
    'python-wheel'
)
source=("${_pkgname}::git+${url}.git#tag=v${pkgver}")
b2sums=('e86afafb2bd97bd9803f7d105e53260b5bf2b3c2595ea9aee0852aa2bc74d281a6f95d6cd632722bd9cecde9e84d9e3506dc3a0c91f93c11a0b4969f5b6b6f26')

prepare() {
    git -C "${srcdir}/${_pkgname}" clean -dfx  
}

build() {
    cd "${srcdir}/${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
