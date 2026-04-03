# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-zlgcan
_name=zlgcan-driver
pkgver=0.2.7
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
sha256sums=('1f665b88a05324b896c5b91679e87f32cfe48d1a3b392608fc0493ce3fae8a00')

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
