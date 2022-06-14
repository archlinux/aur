# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
pkgname=python2-toml
_name=${pkgname#python2-}
pkgver=0.10.2
pkgrel=7
pkgdesc='A Python library for parsing and creating TOML'
arch=('any')
url='https://github.com/uiri/toml'
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-numpy' 'python2-pytest')
_ttgithub='https://github.com/BurntSushi/toml-test'
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        "toml-test-v1.2.0.tar.gz::$_ttgithub/archive/refs/tags/v1.2.0.tar.gz")
noextract=("toml-test-v1.2.0.tar.gz")
sha256sums=('71d4039bbdec91e3e7591ec5d6c943c58f9a2d17e5f6783acdc378f743fcdd2a'
            '33bf4e9c017cd57f3602e72d17f75fb5a7bcc7942541c84f1d98b74c12499846')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  rm toml-test -rf
  tar -zvxf ../toml-test-v1.2.0.tar.gz toml-test-1.2.0/tests/{in,}valid
  mv toml-test-1.2.0 toml-test
  python2 -m pytest
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
