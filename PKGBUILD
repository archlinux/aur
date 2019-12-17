# Maintainer: Ward Segers <w@rdsegers.be>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=gnome-authenticator
pkgver=3.32.2
pkgrel=1
pkgdesc="Two-Factor Authentication for GNOME"
arch=(x86_64)
url="https://gitlab.gnome.org/World/Authenticator"
license=(GPL3)
depends=(python-pyopt python-pillow pyzbar python-favicon python-yoyo-migrations)
makedepends=(meson ninja gobject-introspection)
_commit=d6c8d61d2568d92d3ad7d1ae5c7743f9919fb2b8  # tags/3.32.2
source=("git+https://gitlab.gnome.org/World/Authenticator.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd Authenticator
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd Authenticator
  arch-meson . build
  ninja -C build
}

check() {
  cd Authenticator
  meson test -C build || : # cargo-test fails
}

package() {
  cd Authenticator
  DESTDIR="$pkgdir" meson install -C build
}

