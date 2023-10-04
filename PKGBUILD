# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_core_news_lg
_pkg="${pkgname#python-spacy-}"
pkgver=3.7.0
pkgrel=1
pkgdesc="German pipeline optimized for CPU. Components: tok2vec, tagger, morphologizer, parser, lemmatizer (trainable_lemmatizer), senter, ner."
url="https://spacy.io/models/de#de_core_news_lg"
depends=('python-spacy')
makedepends=('python-setuptools')
license=('MIT')
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/$_pkg-$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=("4015e0da1f842d81ff933b35c1186fdf79980e8b8cdab977eeeb3e6f4b324fa9")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
