# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-ai-urllib4
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=2.1.5
pkgrel=1
epoch=
pkgdesc="A modern HTTP client for Python with HTTP/3, WebSocket extensions, and enhanced security features"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
provides=(${_name} ${pkgname})
conflicts=(${_name} ${pkgname})
_pydeps=(
    certifi
    cryptography
    idna
    h2
    aioquic
    ifaddr
    anyio
    msgpack
    cbor2
    brotli
    zstandard
    pysocks
)
depends=(
    python
    "${_pydeps[@]/#/python-}"
)
makedepends=(
    python-build
    python-installer
    python-wheel
    python-setuptools
)
options=()
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('5ce32cd30eeee344296d8ef0d19dd62afceb518d3987c496222ee63191c98f04')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm0644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    # cp -R docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
