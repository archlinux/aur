# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

_pkgname=spacy-alignments
pkgname=python-${_pkgname}
pkgver=0.9.2
pkgrel=1
pkgdesc="A spaCy package for the Rust tokenizations library"
arch=(x86_64 aarch64)
url="https://github.com/explosion/spacy-alignments"
license=(MIT)
depends=(python-hypothesis)
makedepends=(
    python-pip
    python-wheel
    python-setuptools
    python-setuptools-rust
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/explosion/${_pkgname}/archive/refs/tags/release-v${pkgver}.zip"
)
b2sums=("14c01cb1fd8738ba3ff5886f2258823d121360b1ccc58ec93c091e99d851ed8af341f2c05326d61f3aad12203c9a6dcd4e952011fd89409d101fdec61dbe5344")

build() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-release-v${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
