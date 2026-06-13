# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-webauthn
_name=${pkgname#python-}
pkgver=2.8.0
pkgrel=1
pkgdesc="Pythonic WebAuthn"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/duo-labs/py_webauthn"
_pydeps=(
    cbor2
    cryptography
    pyasn1
    pyopenssl
)
depends=('python'
    "${_pydeps[@]/#/python-}")
makedepends=(
    git
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
license=('BSD-3-Clause')
source=("${_name}::git+${url}.git#tag=v$pkgver")
sha256sums=('80c09c8d8a6a496dcbd2b227b3b8d06384824cf08bfee18370965eda1b08ea6f')

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
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
