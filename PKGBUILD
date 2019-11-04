# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-memory-profiler
pkgver=0.55
pkgrel=2
pkgdesc="A module for monitoring memory usage of a python program"
url="https://github.com/pythonprofilers/memory_profiler"
license=('BSD')
arch=('any')
depends=('python-psutil')
makedepends=('python-setuptools')
checkdepends=('python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pythonprofilers/memory_profiler/archive/$pkgver.tar.gz")
sha512sums=('97f00d7d8b7d564f98b2d58862df69a3a068be056083bcd7719ebc29e58bf22101b8ec6f673fb45ec12626aca5fdad8508e9ce0ec217b3676e2fc1b43504b3c3')

build() {
  cd memory_profiler-$pkgver
  python setup.py build
}

check() {
  cd memory_profiler-$pkgver
  PYTHONPATH="$PWD"/build/lib make test
}

package() {
  cd memory_profiler-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
