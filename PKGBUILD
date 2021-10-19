# Maintainer: gj545rndmu <6zogm6z2nh at bljvf anonbox net>
# Contributor: Skjnldsv <skjnldsv at protonmail com>

pkgname=gnome-pomodoro-git
pkgver=r1161.ddfe240
pkgrel=1
_gitbranch='master'
pkgdesc='A time management utility for GNOME based on the pomodoro technique'
arch=('i686' 'x86_64')
url='https://github.com/gnome-pomodoro/gnome-pomodoro'
license=('GPL3')
depends=('glib2' 'gom' 'gtk3' 'cairo' 'glibc' 'libpeas' 'sqlite' 'gstreamer' 'libcanberra' 'gobject-introspection')
makedepends=('meson' 'vala')
conflicts=('gnome-pomodoro' 'gnome-shell-pomodoro')
provides=('gnome-pomodoro')
source=("$pkgname"::"git+https://github.com/gnome-pomodoro/gnome-pomodoro.git#branch=${_gitbranch}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  arch-meson build
  meson compile -C build
}

package() {
  cd "$srcdir/$pkgname"
  meson install -C build --destdir "$pkgdir"
}
