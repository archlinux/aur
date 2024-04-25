# Maintainer: Aleksy Grabowski <hurufu+arch@gmail.com>

pkgname=python-asn1tools
pkgver=0.156.0
pkgrel=3
pkgdesc='A Python package for ASN.1 parsing, encoding and decoding'
arch=(any)
url='https://github.com/eerimoq/asn1tools.git'
license=('MIT')
depends=(
    python
    licenses
    python-prompt_toolkit
    python-diskcache
)
makedepends=(python-setuptools python-pip python-build python-installer)
checkdepends=(python-pytest python-trio python-bitstruct)
source=(
    asn1tools-$pkgver.tar.gz::https://github.com/eerimoq/asn1tools/archive/$pkgver.tar.gz
    00-handle-odd-numbered-hex-strings.patch
)
md5sums=(
    a42fb735d3d290bd85e63ce5de58f449
    0b9993eb074af91618cb5898345953c6
)
sha1sums=(
    ab39f16eec574d229f58bd49dc079348e3df27c7
    c2e9135e8bfbd08a9f81a1ec05501ff35c116173
)

prepare() {
    patch -p1 -d asn1tools-$pkgver <"$srcdir/00-handle-odd-numbered-hex-strings.patch"
}

build() {
    cd asn1tools-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd asn1tools-$pkgver
    python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
}

check() {
    cd asn1tools-$pkgver
    pytest
}
