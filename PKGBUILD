# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pyspinel
pkgname=python-pyspinel
pkgver=1.0.3
pkgrel=1
pkgdesc="A Python interface to the OpenThread Network Co-Processor (NCP)"
arch=(any)
url="https://github.com/openthread/openthread"
license=(Apache)
depends=(python-pyserial)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('0a48ef767bc07485836ba085baf0ad28c0d99aac5e090521b42da55d18f06ca7')
b2sums=('3e29438b3b57395ba13a41f427671ff967413598ede16ef3ebec127b92f97b9b798e61bd0a54b3a4d8789e19be385d11a02a377fc084ec3de006a35e1262a60c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
