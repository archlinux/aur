# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>

pkgname=python-sysv_ipc
pkgver=1.2.0
pkgrel=0
pkgdesc="System V IPC primitives (semaphores, shared memory and message queues) for Python"
url="http://semanchuk.com/philip/sysv_ipc/"
license=('BSD')
arch=('x86_64')
depends=(
  'python'
)
makedepends=(
  'python-setuptools'
)
source=(
  "sysv_ipc-rel${pkgver}::https://github.com/osvenskan/sysv_ipc/archive/refs/tags/rel${pkgver}.tar.gz"
)
sha512sums=(
  '0c1b58248b1cec304288ab662f77023db7180c3b2d0477f2f26ed3ec2395f381a9b0d54174bb80e785819dbed53267165ccfb6fe87d160eff12d4431cce7b00e'
)

build() {
  cd sysv_ipc-rel${pkgver}
  python setup.py build
}

check() {
  cd sysv_ipc-rel${pkgver}
  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  echo "Python version $python_version"
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$python_version" python -m unittest discover
}

package() {
  cd sysv_ipc-rel${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
