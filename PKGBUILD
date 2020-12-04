# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-memory-profiler
pkgver=0.58.0
pkgrel=1
pkgdesc="A module for monitoring memory usage of a python program"
url="https://github.com/pythonprofilers/memory_profiler"
license=('BSD')
arch=('any')
depends=('python-psutil')
makedepends=('python-setuptools')
checkdepends=('python-numpy')
source=("https://github.com/pythonprofilers/memory_profiler/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('5c02933acffc05f42d2ae98a069d36563e1d26515d439d94ad3903960dd06cd378faae3000b26c022770e71e83db6f770ceaf63cabb92f4159bda0ff9cc4e849')

build() {
  cd memory_profiler-$pkgver
  python setup.py build
}

check() {
  cd memory_profiler-$pkgver
  # Hack entry points by installing it
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.9/site-packages:$PYTHONPATH" PATH="$PWD/tmp_install/usr/bin:$PATH" make test
}

package() {
  cd memory_profiler-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
