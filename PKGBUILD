# Maintainer: Christian Schendel (doppelhelix@gmail.com)

pkgname=gnome-shell-extension-nightthemeswitcher-git
pkgver=74.r0.geff03a9
pkgrel=2
pkgdesc="Automatically toggle your light and dark themes variants"
arch=('any')
url="https://gitlab.com/rmnvgr/nightthemeswitcher-gnome-shell-extension"
install=${pkgname%-git}.install
license=('GPL3'
         'MIT'
         'GPL2'
         'LGPL'
         'CCPL:by-nc-sa')
groups=('gnome-shell-extensions')
depends=('gnome-shell>=1:44')
makedepends=('git'
             'glib2'
             'eslint'
             'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  arch-meson build
  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  meson install -C build --destdir "$pkgdir"
}

