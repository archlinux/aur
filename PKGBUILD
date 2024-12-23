# Maintainer: envolution

pkgname=python-cutlet
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=2
pkgdesc="Romaji converter"
arch=(any)
url="https://github.com/polm/cutlet"
license=(MIT)
depends=(
  python
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)

source=("https://files.pythonhosted.org/packages/61/8c/53a5937d102b6be60ace23565cc845e0c0f91f053c42584e495bb817a0c0/cutlet-${pkgver}.tar.gz")
sha256sums=('9abc50b2c36aabc0c863b7a0fd6a3a651dc372e056f0914d83e76ac2612f3626')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
