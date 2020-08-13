# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sysv_ipc
pkgver=1.0.1
pkgrel=1
pkgdesc="System V IPC primitives (semaphores, shared memory and message queues) for Python"
url="http://semanchuk.com/philip/sysv_ipc/"
license=('BSD')
arch=('x86_64')
depends=('python')
makedepends=('python-setuptools')
source=("http://semanchuk.com/philip/sysv_ipc/sysv_ipc-$pkgver.tar.gz")
sha512sums=('c240828df5a96fe241b0d68f349c7c593ee45115c2867adc577b4da75ec1b3101608fd8da021fec88a7b717af9a4b0e9f9e5ad6a06874a38c3ad2ce467f00989')

build() {
  cd sysv_ipc-$pkgver
  python setup.py build
}

check() {
  cd sysv_ipc-$pkgver
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-3.8" python -m unittest discover
}

package() {
  cd sysv_ipc-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
