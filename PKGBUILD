# Maintainer: mar77i <mar77i at protonmail dot ch>

pkgname=python-summa-git
pkgver=0.1.0.r6.g985402e
pkgrel=1
pkgdesc="TextRank implementation for text summarization and keyword extraction in Python."
license=(MIT)
arch=(any)
url="https://github.com/summanlp/textrank"
makedepends=(python-setuptools)
depends=(python-scipy)
source=('git+https://github.com/summanlp/textrank.git')
sha1sums=(SKIP)

pkgver() {
	cd "$srcdir/textrank"
	git describe --long --tags | sed 's/^v//; s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/textrank"
	python3 setup.py install --root="$pkgdir/" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

check() {
	cd "$srcdir/textrank"
	python3 -m test.test_keywords
	python3 -m test.test_summarizer
}
