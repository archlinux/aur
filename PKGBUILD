# Maintainer: Oskar Roesler <oskar at oskar-roesler dot de>

pkgname=python2-cffi
pkgver=1.15.0
pkgrel=3
pkgdesc="Foreign Function Interface for Python calling C code"
arch=('x86_64')
url="https://cffi.readthedocs.org/"
license=('MIT')
depends=('python2-pycparser')
makedepends=('python2-setuptools')
source=("https://foss.heptapod.net/pypy/cffi/-/archive/v$pkgver/cffi-v$pkgver.tar.bz2")
sha256sums=('96034f9bb04fde361656e0edae8510f7f3a17e24d5fda11a13b82ee03ad0e23c')

build() {
  cd "$srcdir"/cffi-v$pkgver
  python2 setup.py build
}

package() {
  cd cffi-v$pkgver

  # remove files created during check() for reproducible SOURCES.txt
  rm -rf testing/cffi{0,1}/__pycache__/

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
