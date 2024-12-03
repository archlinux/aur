# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_lg
_pkg="${pkgname#python-spacy-}"
pkgver=3.8.0
pkgrel=1
pkgdesc="English pipeline optimized for CPU. Components: tok2vec, tagger, parser, senter, ner, attribute_ruler, lemmatizer."
url="https://spacy.io/models/en#en_core_web_lg"
depends=(python-spacy)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/$_pkg-$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=("7a3c89f3243950000a102c5f124277bbbde2dec467d548eee28b23bd1938ed62")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
