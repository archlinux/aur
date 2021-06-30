
pkgname=python2-m2r
pkgver=0.2.1
pkgrel=7
pkgdesc="Markdown to reStructuredText converter"
arch=('any')
url="https://github.com/miyakogi/m2r"
license=('MIT')
depends=('python2-mistune' 'python2-docutils')
makedepends=('python2-setuptools')
checkdepends=('python2-mock' 'python2-pygments' 'python2-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/miyakogi/m2r/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('847f04538ee52f0b0a88cee9474ed889e8114a3a7b1fb221cdaa867ab70ca52f517250f2c8bbf795ae598c7b6614e6d03d9f6f05b7e3d56fb8087d63eb52f1bc')

build() {
  cd "$srcdir/m2r-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/m2r-$pkgver"
  python2 setup.py pytest
}

package() {
  cd "$srcdir"/m2r-$pkgver
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  mv "$pkgdir"/usr/bin/m2r{,-python2}
  install -D -m644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
