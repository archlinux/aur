# Maintainer: nycex <nycexyt@gmail.com>
pkgname=sway-latest-git
pkgver=1.0.alpha.6.r19.geae42606
pkgrel=1
pkgdesc='i3 compatible window manager for Wayland (master branch)'
arch=('x86_64')
url='http://swaywm.org'
license=('MIT')
depends=('json-c' 'pcre' 'wlroots-git' 'wayland' 'wayland-protocols'
         'libxkbcommon' 'cairo' 'pango' 'gdk-pixbuf2' 'pixman' 'libcap'
         'libinput' 'pam' 'xorg-server-xwayland' 'dbus')
optdepends=('libelogind: systemd logind support')
makedepends=('git' 'meson' 'ninja' 'scdoc')
provides=('sway')
conflicts=('sway' 'sway-git' 'sway-wlroots-git')
install=sway-latest-git.install
source=('git+https://github.com/swaywm/sway.git')
sha1sums=('SKIP')
options=('!strip' 'debug')

pkgver() {
  cd "$srcdir/sway"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/sway"
}

build() {
	cd "$srcdir/sway"
  rm -rf "$srcdir/build"
  meson -Dwerror=false --prefix /usr "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
	cd "$srcdir/build"
  DESTDIR="$pkgdir" ninja install
}
