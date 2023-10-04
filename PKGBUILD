# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>

pkgname=python-spacy-de_dep_news_trf
_pkg="${pkgname#python-spacy-}"
pkgver=3.7.2
pkgrel=1
pkgdesc="German transformer pipeline (Transformer(name='bert-base-german-cased', piece_encoder='bert-wordpiece', stride=136, type='bert', width=768, window=176, vocab_size=30000)). Components: transformer, tagger, morphologizer, parser, lemmatizer (trainable_lemmatizer)."
url="https://spacy.io/models/de#de_dep_news_trf"
depends=(
    python-spacy
    python-spacy-transformers
)
makedepends=(
    python-pip
    python-wheel
    python-setuptools
)
license=(MIT)
arch=(any)
source=("https://github.com/explosion/spacy-models/releases/download/$_pkg-$pkgver/$_pkg-$pkgver.tar.gz")
sha256sums=("d8ae1e4085671e19da225e137de0250c826fe0e45e9afedfdc09769b783fdefd")

build() {
	cd $_pkg-$pkgver
    python -m build --wheel --no-isolation
}

package() {
	cd $_pkg-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
