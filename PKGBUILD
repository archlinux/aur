# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>
pkgname=python38-jaraco.text
pkgver=3.10.0
pkgrel=1
pkgdesc='Module for text manipulation'
arch=('any')
url='https://github.com/jaraco/jaraco.text'
license=('MIT')
depends=('python38' 'python38-jaraco.functools' 'python38-jaraco.context' 'python38-autocommand' 'python38-inflect' 'python38-more-itertools')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest')
conflicts=('python38-jaraco')
replaces=('python38-jaraco')
source=("https://files.pythonhosted.org/packages/source/j/jaraco.text/jaraco.text-$pkgver.tar.gz")
sha512sums=('1c83dc9247e8c55ed20d8768abcb66c3fb4cdfb9ade3744f3d3c3e705b94e376c7b44fdfe242189001d69fbf28fdb5601ff33b1874495b3c2ad9bdd781265f43')

build() {
  cd "$srcdir/jaraco.text-$pkgver"
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/jaraco.text-$pkgver"
  PYTHONPATH="$PWD" python3.8 -m pytest
}

package() {
  cd "$srcdir/jaraco.text-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
