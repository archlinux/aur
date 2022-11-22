# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-memory-profiler
pkgver=0.61
pkgrel=1
pkgdesc="A module for monitoring memory usage of a python program"
url="https://github.com/pythonprofilers/memory_profiler"
license=('BSD')
arch=('any')
depends=('python-psutil')
makedepends=('python-setuptools')
checkdepends=('python-numpy')
source=("https://github.com/pythonprofilers/memory_profiler/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('02c70a049107ad4df635e20e22eaaa91fd4e4fd29690b0a7c314e08ed6e076bbb81f85dd97924ed35f7f0133cfd3c7e55b35400449489733beb172debe592c4e')

build() {
  cd memory_profiler-$pkgver
  python setup.py build
}

check() {
  cd memory_profiler-$pkgver
  # Hack entry points by installing it
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.10/site-packages:$PYTHONPATH" PATH="$PWD/tmp_install/usr/bin:$PATH" make test
}

package() {
  cd memory_profiler-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
