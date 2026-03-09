# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-ubelt
_pkgname=ubelt
pkgver=1.4.1
pkgrel=1
pkgdesc="A Python utility belt containing simple tools"
arch=('any')
url="https://github.com/Erotemic/ubelt"
license=('Apache-2.0')
depends=(python python-blake3 python-colorama python-dateutil python-pygments python-xxhash)
optdepends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-requests python-xdoctest)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('adb17ab91d929b38e9f787a1cecd10546b64a2b92320940cdc3ab7e14af7d351')

build(){
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package(){
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
  cd "$_pkgname-$pkgver"
  PYTHONPATH=. pytest tests
}

### vim:ts=2:sw=2:et:
