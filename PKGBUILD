# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=atk-git
pkgver=2.36.0
pkgrel=1
pkgdesc="Interface definitions of accessibility infrastructure"
url="https://gitlab.gnome.org/GNOME/atk"
arch=(x86_64)
license=(LGPL)
depends=(glib2)
makedepends=(gobject-introspection git meson)
provides=(atk libatk-1.0.so)
conflicts=(atk)
source=("git+https://gitlab.gnome.org/GNOME/atk.git")
sha256sums=('SKIP')

pkgver() {
  cd atk
  git describe --tags | sed 's/^ATK_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd atk
}

build() {
  arch-meson atk build -D docs=false
  ninja $NINJAFLAGS -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

