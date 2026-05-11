# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-webauthn
_name=${pkgname#python-}
pkgver=2.7.1
pkgrel=3
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
sha256sums=('f8cb9e501c201935213ae9327ed62eec6b81e6ad19c6bd6c0601783f4d6c5b10')

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
