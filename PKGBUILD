# Maintainer: Alex Grabowski <hurufu+arch@gmail.com>

pkgname=python-asn1tools
pkgver=0.167.0
pkgrel=1
pkgdesc='A Python package for ASN.1 parsing, encoding and decoding'
arch=(any)
url='https://github.com/eerimoq/asn1tools.git'
license=(MIT)
depends=(
    python
    licenses
    python-pyparsing
    python-bitstruct
)
makedepends=(
    python-setuptools
    python-build
    python-installer
    python-prompt_toolkit
    python-diskcache
)
checkdepends=(
    python-pytest
    python-trio
)
source=(
    git+https://github.com/eerimoq/asn1tools.git#commit=7b72219c5bc529068d1b9abe84a46773f38c465f
)
b2sums=(
    SKIP
)

pkgver() {
    cd asn1tools
    ./setup.py --version
}

build() {
    cd asn1tools
    python -m build --wheel --no-isolation
}

package() {
    cd asn1tools
    python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
}

check() {
    cd asn1tools
    pytest
}
