# Maintainer: Srevin Saju <srevinsaju@sugarlabs.org>

pkgname=archivy-git
pkgver=v1.3.1.r3.gd16df87
pkgrel=2
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
source=("git+https://github.com/archivy/archivy.git#commit=d16df878a988122213ce8b8fea1d64d9219a370c"
        "00-do-not-pin-requirements.patch")
sha256sums=('SKIP'
            '538f7d96138f421d70ed72a8f101c1095726d5ee53c19e6cd924b30ca6a7a3a4')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")


prepare() {
    cd "$srcdir/${pkgname%-git}"
    git apply "$srcdir/00-do-not-pin-requirements.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    rm -rf tests
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
