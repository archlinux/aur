# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dom-toml
_name=${pkgname#python-}
pkgver=2.4.0
pkgrel=1
pkgdesc="Dom's tools for Tom's Obvious, Minimal Language"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url='https://dom-toml.readthedocs.io/en/latest/'
depends=(
    python
    python-attrs
    python-domdf-python-tools
    python-tomli
    python-tomli-w
    python-numpy
    python-typing_extensions
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'python-flit-core'
)
license=('MIT')
source=("${_name}::git+https://github.com/domdfcoding/dom_toml.git#tag=v$pkgver")
sha512sums=('37f6009a286ffe4c4cc59bbd04c2c3bd025c4773f850716dd430870bf8012c443c3256b8af9cdf68852f34abd6e4ba13592ec8ef9048d0a16aaf6e7ec4dd1834')

prepare() {
    git -C "${srcdir}/${_name}" clean -dfx
    cd "${srcdir}/${_name}"
    sed -i 's/"\([a-zA-Z0-9_.-]*\)[<>=!~][^"]*"/"\1"/g' pyproject.toml
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
