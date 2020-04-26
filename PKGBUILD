# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.4.2
pkgrel=1
pkgdesc="SciELO Publishing Schema XML document front matter metadata reader/sanitizer"
arch=('any')
url='https://github.com/scieloorg/clea'
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-flake8')
depends=('python-lxml' 'python-numpy' 'python-levenshtein'
         'python-ujson' 'python-click'
         'python-regex' 'python-unidecode')
optdepends=('python-flask: development web server'
            'gunicorn: web server alternative')
options=(!emptydirs)
sha256sums=('3538d507ce7a7309b771edb13965f799a5c2f5fe2dce7efb2bcac57dda0b2acd')
source=("clea-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

check() {
  cd "$srcdir/clea-$pkgver"
  python -m pytest
}

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
