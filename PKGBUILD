# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-memory-profiler
pkgver=0.56
pkgrel=1
pkgdesc="A module for monitoring memory usage of a python program"
url="https://github.com/pythonprofilers/memory_profiler"
license=('BSD')
arch=('any')
depends=('python-psutil')
makedepends=('python-setuptools')
checkdepends=('python-numpy')
source=("https://github.com/pythonprofilers/memory_profiler/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('39c135561ff414e448777d85f62853438d09f13db9fb4eefa5e673dcbf2d9fb9b7afa522cac69470c8087211457762fa5150a38edec0a61da44b06b816043c82')

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
