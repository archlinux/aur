# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=dconf-editor-git
pkgver=3.31.2.r107.gbe77980
pkgrel=1
pkgdesc="dconf Editor"
arch=(x86_64)
url="https://wiki.gnome.org/Projects/dconf"
license=(GPL3)
groups=(gnome-extra)
depends=(gtk3 dconf)
makedepends=(vala meson appstream-glib git)
provides=(dconf-editor)
conflicts=(dconf-editor)
source=("git+https://gitlab.gnome.org/GNOME/dconf-editor.git")
sha256sums=('SKIP')

pkgver() {
  cd dconf-editor
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd dconf-editor
}

build() {
  arch-meson dconf-editor build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}