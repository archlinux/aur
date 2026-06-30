# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-webauthn
_name=${pkgname#python-}
pkgver=3.0.0
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
sha256sums=('ee43cb477c7d2f645bbc1b176a2dba0844ff57ae12b9357ac18ae2b1f8c2e6f8')

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
