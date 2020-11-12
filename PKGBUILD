# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-memory-profiler
pkgver=0.57
pkgrel=3
pkgdesc="A module for monitoring memory usage of a python program"
url="https://github.com/pythonprofilers/memory_profiler"
license=('BSD')
arch=('any')
depends=('python-psutil')
makedepends=('python-setuptools')
checkdepends=('python-numpy')
source=("https://github.com/pythonprofilers/memory_profiler/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c6e2f755656dc820dfc2cf7a659dc319b3d1aa0df144ac6a08db35f4b38a90a9b994cf9c8320b8370f51c97e0d0bf2f9c4a3ab070b4934879f8e579b732e426a')

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
