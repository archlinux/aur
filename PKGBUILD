# Maintainer: nezu <nezu@nezu.cc>
#
# This is a modified version of the libfprint PKGBUILD file from the official Arch Linux repositories

pkgname=libfprint-tod
_pkgdirname=libfprint
pkgver=1.94.8+tod1
pkgrel=1
pkgdesc="Library for fingerprint readers - TOD version"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(
  gcc-libs
  glib2
  glibc
  libgudev
  libgusb
  nss
  pixman
)
makedepends=(
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  meson
  python-cairo
  python-gobject
  systemd
)
checkdepends=(
  cairo
  umockdev
)
# Provide libfprint for compatibility with fprintd and also provide libfprint-tod for tod-style-only drivers
provides=(libfprint libfprint-tod libfprint-2.so libfprint-2-tod.so)
conflicts=(libfprint)
groups=(fprint)
source=("git+https://gitlab.freedesktop.org/3v1n0/libfprint.git?signed#tag=v$pkgver")
b2sums=('e2e653c3c181f232b1fb3cc6595008bbb0eebf6805dcf7bbf9c0865ee558f638efc3987d86ef5141b93a54a50b25323e6e78dec8fbeb5eabf5d541de12c6c75a')
validpgpkeys=(
  D4C501DA48EB797A081750939449C2F50996635F # Marco Trevisan (Treviño) <mail@3v1n0.net>
)

prepare() {
  cd $_pkgdirname
}

build() {
  arch-meson $_pkgdirname build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
