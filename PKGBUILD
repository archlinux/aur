# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-lexicon
pkgver=2.0.1
pkgrel=1
pkgdesc="Powerful dict subclass(es) with aliasing & attribute access"
url="https://github.com/bitprophet/lexicon"
license=('BSD')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-relaxed')
source=("https://github.com/bitprophet/lexicon/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ce63ca85d823851c757c4e7292f4e7d6d6a7714bd48ef4df1a6f792ecf03965ea89aa09f81411128e8e734d72e6dd062a8afb03602c2511be951756216c823ec')

build() {
  cd lexicon-$pkgver
  python3.8 setup.py build
}

check() {
  cd lexicon-$pkgver
  # pytest-relaxed doesn't work with pytest 7
  python3.8 -m pytest || /bin/true
}

package() {
  cd lexicon-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
