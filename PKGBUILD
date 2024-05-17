# Maintainer: Luke Arms <luke@arms.to>
# Contributor: dustball

pkgname=quicktile-git
_pkgname=${pkgname%-git}
pkgver=463.ce0c088
pkgrel=1
epoch=1
url="https://github.com/ssokolow/quicktile"
pkgdesc="Adds window-tiling hotkeys to any X11 desktop"
arch=('any')
license=('GPL2')
depends=('python' 'gtk3' 'libwnck3' 'python-gobject' 'python-xlib')
optdepends=('python-dbus: required if you want to interact with QuickTile over D-Bus')
makedepends=('git' 'python-setuptools')
provides=('quicktile')
conflicts=('quicktile')
source=("git+https://github.com/ssokolow/quicktile.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf '%s.%s' \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
