
pkgname=python2-hyperlink
pkgver=21.0.0
pkgrel=3
pkgdesc='A featureful, correct URL for Python'
arch=('any')
license=('BSD')
url='https://github.com/python-hyper/hyperlink'
depends=('python2-idna' 'python2-typing')
makedepends=('python2' 'python2-setuptools')
checkdepends=('python2-pytest-runner' 'python2-hypothesis' 'python2-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-hyper/hyperlink/archive/refs/tags/v$pkgver.tar.gz"
        '0001-Silence-health-check-errors-form-hypothesis.patch')
sha512sums=('fa6c9da0e414319bf20be66dc5593b3fe2e8772c62d36adf2de32c277e49469ada952ca591f41fae8d2229812d79f1e6b7eaa23e63995c7f02ce10aa5569cd61'
            '86b649111cb2302db70ffeefc457a2e03924d2dd8d3e4c2e19e5c5385467fe02b984925029bd777bff3906e0461677275e0b8649276ffb86235416d84e433436')

prepare() {
  cd hyperlink-$pkgver
  patch --strip=1 --input=../0001-Silence-health-check-errors-form-hypothesis.patch
}

build() {
  cd hyperlink-$pkgver
  python2 setup.py build
}

check() {
  cd hyperlink-$pkgver
  python2 setup.py pytest
}

package() {
  cd hyperlink-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
