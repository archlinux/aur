# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-benchmark
pkgver=4.0.0
pkgrel=1
pkgdesc='A py.test fixture for benchmarking code'
arch=('any')
license=('BSD')
url='https://github.com/ionelmc/pytest-benchmark'
depends=('python38-pytest' 'python38-py-cpuinfo')
makedepends=('python38-setuptools')
checkdepends=('python38-pygal' 'python38-pygaljs' 'python38-freezegun' 'mercurial' 'python38-aspectlib'
              'python38-pytest-xdist' 'python38-elasticsearch' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ionelmc/pytest-benchmark/archive/v$pkgver.tar.gz")
sha512sums=('88636e44c184f5072ad081a89f08e8838a11397e6b88298d7f235b531f894792001b858fc5c810b1399d41ec55de5db9057552fb7544fb405a04c3ba5ffbe329')

build() {
  cd pytest-benchmark-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-benchmark-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" PATH="$PWD/tmp_install/usr/bin:$PATH" python3.8 -m pytest tests
}

package() {
  cd "$srcdir"/pytest-benchmark-$pkgver
  python3.8 setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
