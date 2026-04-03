# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-zlgcan
_name=zlgcan-driver
pkgver=0.2.6
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
sha256sums=('6c4e35d06c03ae85c33dbe20f94cca99ce43dac7700586096d7d76f39916a888')

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
