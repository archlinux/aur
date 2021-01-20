# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=archivy-git
pkgver=v0.11.1.r3.g5621fe7
pkgrel=1
pkgdesc="A self-hosted knowledge repository, to preserve useful content to your knowledge bank."
arch=('any')
url="https://github.com/archivy/archivy"
license=('MIT')
makedepends=('python-setuptools')
depends=('python-flask' 'python-flask-wtf' 'python-wtforms'
         'python-werkzeug' 'python-appdirs' 'python-attrs'
         'python-beautifulsoup4' 'python-elasticsearch'
         'python-dotenv' 'python-frontmatter' 'python-requests'
         'python-tinydb' 'python-validators' 'python-flask-login' 'python-brotli'
         'python-click-plugins' 'python-html2text' 'python-flask-compress')
optdepends=('elasticsearch')
source=("git+https://github.com/archivy/archivy.git#commit=5621fe765e311cabcb24c58f6bdcb22f2ae0c462"
        "00-do-not-pin-requirements.patch")
sha256sums=('SKIP'
            '339f305aded981272230193c446307c2731477edf49e9ec6ea684351e5e62b8b')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")


prepare() {
    cd "$srcdir/${pkgname%-git}"
    git apply "$srcdir/00-do-not-pin-requirements.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
