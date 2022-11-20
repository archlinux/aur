# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-automat
pkgver=22.10.0
pkgrel=1
arch=('any')
license=('MIT')
pkgdesc="Self-service finite-state machines for the programmer on the go."
url="https://github.com/glyph/automat"
depends=('python38-attrs' 'python38-six')
makedepends=('python38-setuptools-scm' 'python38-wheel')
checkdepends=('python38-pytest-benchmark' 'python38-twisted' 'python38-graphviz')
optdepends=('python38-graphviz: for automat-visualize'
            'python38-twisted: for automat-visualize')
source=("https://github.com/glyph/automat/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('16caea66a8621b7d50e68e94007085218ec40ae0f57599d5076ed1915d4a2ebabd2da66659ba70acb9c6d30bc354bcd6126f913af0c0a005db305ca0c203481d')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd automat-$pkgver
  python3.8 setup.py build
}

check() {
  cd automat-$pkgver
  pytest
}

package() {
  cd automat-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/python38-automat/
}
