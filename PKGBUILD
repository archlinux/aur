# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

_name=trayer
pkgname=python-${_name}-git
provides=(python-trayer)
pkgver=0.1.1.r0
pkgrel=1
pkgdesc="System Tray Icons for GTK4"
url="https://github.com/enne2/trayer"
arch=(x86_64)
license=(MIT)
depends=(
  glibc
  python
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
source=("git+https://github.com/Enne2/trayer")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | cut -c2- | cut -d "-" -f 1-2 | sed 's/-/.r/'
}
prepare() {
  cd $_name
}

build() {
  python -m build --wheel --no-isolation $_name
}

package() {
  python -m installer --destdir="$pkgdir" $_name/dist/*.whl
  install -Dm644 $_name/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
