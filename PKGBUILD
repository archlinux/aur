# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-ansicolors
pkgver=1.1.8
_commit=c965f5b9103c5bd32a1572adb8024ebe83278fb0
pkgrel=6
pkgdesc="ANSI colors for Python"
url="https://github.com/jonathaneunice/colors"
license=('ISC')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/jonathaneunice/colors/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('f60770496614b75fc2a6bab15c55a87c245ac233c907708572e76d4701690895b3a350b7ab2934304262a8e9076fbff64a9792c2345fe5994af0c6c09209e6a2')

build() {
  cd colors-$_commit
  python setup.py build
}

check() {
  cd colors-$_commit
  python -m pytest
}

package() {
  cd colors-$_commit
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
