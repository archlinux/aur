# Maintainer: Nils Brause <nilschrbrause@gmail.com>
pkgname=sway-wlroots-git
pkgver=1.0.alpha.1.r103.g7434c524
pkgrel=6
pkgdesc='i3 compatible window manager for Wayland'
arch=('x86_64')
url='http://swaywm.org'
license=('MIT')
depends=('json-c' 'pcre' 'wlroots-git' 'wayland' 'wayland-protocols'
         'libxkbcommon' 'cairo' 'pango' 'gdk-pixbuf2' 'pixman' 'libcap'
         'libinput' 'pam' 'xorg-server-xwayland')
makedepends=('git' 'meson' 'ninja' 'asciidoc')
provides=('sway')
conflicts=('sway' 'sway-git')
install=sway-wlroots-git.install
source=('git+https://github.com/swaywm/sway.git'
        'swaybar-fix.patch')
sha1sums=('SKIP'
          '64ca62152b83a9a7ebae0ea86631012d5af39bea')

pkgver() {
  cd "$srcdir/sway"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/sway"
  patch -Np1 -i "$srcdir/swaybar-fix.patch"
}

build() {
	cd "$srcdir/sway"
  meson --prefix /usr "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
	cd "$srcdir/build"
  DESTDIR="$pkgdir" ninja install
}
