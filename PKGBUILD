# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-zlgcan
_name=zlgcan-driver
pkgver=0.3.0
pkgrel=1
pkgdesc="Python wrapper for zlgcan driver"
provides=(${pkgname} zlgcan)
conflicts=(${pkgname} zlgcan)
arch=($CARCH)
url="https://github.com/jesses2025smith/zlgcan-driver"
_pydeps=(
    can
)
depends=(
    glibc
    libgcc
    'python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    python-maturin
)
license=('LGPL-3.0-or-later')
options=('!strip' '!debug')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('e23ad861ba0ac0e83d466b96d2b85f3bc1ac0ef3decc64d3287379aa8aca0d60')

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
