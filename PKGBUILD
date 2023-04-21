# Maintainer: William Tang <galaxyking0419@gmail.com>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: jyantis <yantis@yantis.net>

_pkgname=textblob
pkgname=python-textblob-git
pkgver=0.17.1.r1.g9945064
pkgrel=1
pkgdesc='Simple, Pythonic, text processing--Sentiment analysis, part-of-speech tagging, noun phrase extraction, translation, and more.'
arch=('any')
url='https://github.com/sloria/textblob'
license=('MIT')

provides=('python-textblob')
conflicts=('python-textblob')
depends=('python-nltk' 'nltk-data')
makedepends=('git' 'python-setuptools')

source=('git+https://github.com/sloria/textblob.git')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    python setup.py build
}

package() {
    cd "${_pkgname}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
