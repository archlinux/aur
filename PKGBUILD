# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
_name_=pylink
pkgname=python-pylink-square
pkgver=0.14.1
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache)
depends=(python-future python-psutil python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-mock python-pytest)
conflicts=(pylink)
provides=(pylink)
replaces=(pylink)
# sdist on pypi.org has no tests: https://github.com/square/pylink/issues/119
# source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
source=($_name_-$pkgver.tar.gz::https://github.com/square/pylink/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('c859c76fbc72c18350356ef1825f6abfdc7fe95741847466eeb7fc21b5dcf95844dabb870fb4807396cba3d5f5613fa2ccea13fb9b13443c95d522b97021c4ad')
b2sums=('d046c12ef2be83f9823833c161593e2cc5862968407400846130fdda456224b217b5c8f6a569a0f8ecc62e1122ea47d44351dfb1fc817e5e55a53fb4ea816e1d')

build() {
  cd $_name_-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name_-$pkgver
  pytest -v
}

package() {
  cd $_name_-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 *.md -t "$pkgdir/usr/share/doc/$pkgname"
}
