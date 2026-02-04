# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-dom-toml
_name=${pkgname#python-}
pkgver=2.3.0
pkgrel=1
pkgdesc="Dom's tools for Tom's Obvious, Minimal Language"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url='https://dom-toml.readthedocs.io/en/latest/'
depends=(
    python
    python-domdf-python-tools
    python-toml
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
sha512sums=('7ec94f3a22f90463b6f3d9f1db942b4d3065f315cee333e290b0cb1d1518a635988c596d51050f31c135b0f4fe131bd68328aeff682797db3ae6ee407e36610e')

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
