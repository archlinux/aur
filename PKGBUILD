# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sysv_ipc
pkgver=1.1.0
pkgrel=3
pkgdesc="System V IPC primitives (semaphores, shared memory and message queues) for Python"
url="http://semanchuk.com/philip/sysv_ipc/"
license=('BSD')
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools')
source=("http://semanchuk.com/philip/sysv_ipc/sysv_ipc-$pkgver.tar.gz")
sha512sums=('30615c7fcd2ce45b5602fbd61bc2061f5fd44eb7d8ec0bcfd2979e2e750b0f7093bad938cb715ba65dac306c576f76973d462ecc52785fc8f7bacc70a84d79ff')

build() {
  cd sysv_ipc-$pkgver
  python setup.py build
}

check() {
  cd sysv_ipc-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-311" python -m unittest discover
}

package() {
  cd sysv_ipc-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
