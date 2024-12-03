# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_trf
_pkg="${pkgname#python-spacy-}"
pkgver=3.8.0
pkgrel=1
pkgdesc="English transformer pipeline (roberta-base). Components: transformer, tagger, parser, ner, attribute_ruler, lemmatizer."
arch=(any)
url="https://spacy.io/models/en#en_core_web_trf"
license=(MIT)
depends=(
    python-spacy
    python-spacy-transformers
)
makedepends=(
    python-pip
    python-wheel
    python-setuptools
)
source=("https://github.com/explosion/spacy-models/releases/download/$_pkg-$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=("eaed18a77cbd6fad1b0605d2535c2091010d9aaf87b6264c2080042dd394621f")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
