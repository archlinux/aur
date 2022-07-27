# Maintainer: Misha <mishakmak at gmail dot com>

pkgname=pam-fprint-grosshack
pkgver=0.3.0
pkgrel=1
pkgdesc="PAM module enabling simultaneous fingerprint (fprintd) and password authentication"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(GPL)
depends=(fprintd glib2 libfprint polkit dbus dbus-glib systemd)
makedepends=(cmake meson pam_wrapper python-cairo python-dbus python-dbusmock)
source=("git+https://gitlab.com/mishakmak/pam-fprint-grosshack.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd $pkgname 
  arch-meson . build \
    -D pam_modules_dir=/usr/lib/security
  meson compile -C build
}

check() {
  cd $pkgname 
  meson test -C build --print-errorlogs
}

package() {
  cd $pkgname 
  meson install -C build --destdir "$pkgdir"
}
