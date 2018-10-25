# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-memory-profiler
pkgver=0.54
pkgrel=1
pkgdesc="A module for monitoring memory usage of a python program"
url="https://github.com/pythonprofilers/memory_profiler"
license=('BSD')
arch=('any')
depends=('python-psutil')
makedepends=('python-setuptools')
checkdepends=('python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pythonprofilers/memory_profiler/archive/v$pkgver.tar.gz")
sha512sums=('1ee26a0847b2a84d7ec67d48bd7428c27d6bd0c28196dc922af23745d012c6bca2847292ff2fb5803c83170b92b7850e6bd96a6a646f1a0a5507ea4bfbea0287')

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
