# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: FzerorubigD <Fzerorubigd {AT} GMail {DOT} com>

pkgname=gpaste-git
pkgver=3.22.1+23+g0923e96
pkgrel=1
pkgdesc="Clipboard management system"
url="http://www.imagination-land.org/tags/GPaste.html"
license=(GPL3)
arch=(i686 x86_64)
depends=(gtk3)
makedepends=(intltool vala appstream-glib gobject-introspection gnome-shell gnome-control-center git)
optdepends=("wgetpaste: Upload clipboard contents")
provides=("gpaste=$pkgver")
conflicts=(gpaste)
options=(!emptydirs)
source=("$pkgname::git+https://github.com/keruspe/gpaste.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  arch-meson "$pkgname" "$pkgname/build"
}

build() {
  meson compile -C "$pkgname/build"
}

check () {
  meson test -C "$pkgname/build"
}

package() {
  meson install --destdir "$pkgdir" -C "$pkgname/build"
}
