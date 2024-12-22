# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>

pkgname=python-linuxfd
pkgver=1.5
pkgrel=3
pkgdesc="Bindings for the Linux eventfd/signalfd/timerfd/inotify syscalls"
arch=('x86_64')
license=('LGPL-3.0-or-later')
url='https://github.com/FrankAbelbeck/linuxfd'

depends=(
  'glibc'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

_pypi=linuxfd
source=(
  "https://files.pythonhosted.org/packages/source/${_pypi::1}/$_pypi/$_pypi-$pkgver.tar.gz"
)
sha256sums=(
  'b8c00109724b68e093f9b556edd78e41ed65fb8d969fd0e83186a97b5d3139b4'
)

build() {
  cd "$srcdir/$_pypi-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/linuxfd-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
