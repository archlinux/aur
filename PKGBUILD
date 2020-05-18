# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=remotely-git
pkgver=1.0.r10.g8792370
pkgrel=2
pkgdesc="simple VNC viewer for the GNOME desktop environment"
arch=(i686 x86_64 armv7h aarch64)
url="https://gitlab.gnome.org/World/Remotely"
license=(GPL3)
depends=(gtk-vnc)
makedepends=(git meson vala)
provides=(remotely)
conflicts=(remotely)
source=("git+https://gitlab.gnome.org/World/Remotely.git")
md5sums=('SKIP')

pkgver() {
  cd Remotely
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson Remotely build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
