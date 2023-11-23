# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=python-spacy-en_core_web_md
_pkg="${pkgname#python-spacy-}"
pkgver=3.7.1
pkgrel=1
pkgdesc="English pipeline optimized for CPU. Components: tok2vec, tagger, parser, senter, ner, attribute_ruler, lemmatizer."
arch=(any)
url="https://spacy.io/models/en#en_core_web_md"
license=(MIT)
depends=(python-spacy)
makedepends=(python-setuptools)
source=("https://github.com/explosion/spacy-models/releases/download/$_pkg-$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=("3273a1335fcb688be09949c5cdb73e85eb584ec3dfc50d4338c17daf6ccd4628")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
