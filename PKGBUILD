# Maintainer: Marko Givens <marcxjo@cerebralbleach.com>

pkgname=gnome-shell-extension-extension-list
_pkgname=extension-list
pkgver=44.0
pkgrel=1
pkgdesc="A Simple GNOME Shell extension manager in the top panel"
arch=('any')
url="https://github.com/tuberry/extension-list"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson')
provides=('gnome-shell-extension-extension-list')
conflicts=('gnome-shell-extension-extension-list-git')
source=("$_pkgname::git+$url#tag=$pkgver")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  cd "$srcdir/$_pkgname"

  git submodule update --init --recursive

  meson setup build -Dtarget=system --prefix=/usr
}

package() {
  cd "$srcdir/$_pkgname"

  meson install -C build --destdir "$pkgdir"
}
