# Maintainer: FifthTundraG <fifthtundrag {hat} proton {dont} me>

pkgname=skylanders-gamepad-daemon-git
_name=skylanders-gamepad-daemon
pkgver=1.0.0.2.gea9fe25
pkgrel=1
pkgdesc="Userspace daemon providing support for the Skylanders Trap Team mobile gamepad"
arch=("x86_64") # The package likely works on aarch64 systems, but this has not been tested so will not be advertised
url="https://github.com/FifthTundraG/skylanders-gamepad-daemon"
license=("GPL3")
depends=("bluez")
makedepends=("git" "pkg-config" "libevdev" "glib2")
install=$pkgname.install
source=("git+https://github.com/FifthTundraG/skylanders-gamepad-daemon.git")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/$_name"
  git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
  cd "$srcdir/$_name"
  make
}

package() {
  cd "$srcdir/$_name"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
