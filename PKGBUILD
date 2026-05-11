# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-webauthn
_name=${pkgname#python-}
pkgver=2.7.0
pkgrel=1
pkgdesc="Pythonic WebAuthn"
provides=(${pkgname})
conflicts=(${pkgname})
arch=('any')
url="https://github.com/duo-labs/py_webauthn"
_pydeps=(
    asn1crypto
    cbor2
    cryptography
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
sha256sums=('5b27aa5726796b7a9efecc1bd70b54ca5f8fa23a07c79672eca32f2782b2b895')

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
