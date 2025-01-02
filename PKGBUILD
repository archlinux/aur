# Maintainer: Carl Davis <aur@carldavis.com>

pkgname=python-urwidgets
pkgver=0.2.1
pkgrel=1
pkgdesc="A collection of widgets for urwid"
arch=(any)
url="https://github.com/AnonymouX47/urwidgets"
license=('MIT')
_name=${pkgname#python-}
depends=(python-urwid)
optdepends=()
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('f9f2bcd2949da1105c287806dab773aa7bdf5852226cdb128aaf3004136f3eef')
build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

