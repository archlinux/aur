# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>
# Contributor: Svitozar Cherepii <razotivs@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
# Contributor: TingPing <tingping@tingping.se>
# Contributor: Omar Pakker <omar.pakker@oracle.com>
pkgname=retro-gtk-git
pkgver=1.0.2.r61.g9033b2a
pkgrel=1
pkgdesc="Toolkit to write GTK based Libretro frontends"
arch=('x86_64' 'aarch64')
url="https://gnome.pages.gitlab.gnome.org/retro-gtk/"
license=('GPL-3.0-or-later')
depends=(
  'libepoxy'
  'glib2'
  'gtk4'
  'libpulse'
  'libsamplerate'
)
makedepends=(
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'vala'
)
provides=("${pkgname%-git}" 'libretro-gtk-2.so')
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/GNOME/retro-gtk.git')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build \
    -D build-doc=true \
    -D install-doc=true
  meson compile -C build
}

#check() {
  # Tests try to run the installed /usr/lib/retro-runner

#  dbus-run-session xvfb-run \
#    -s '-screen 0 1920x1080x24 -nolisten local' \
#    meson test -C build --no-rebuild --print-errorlogs
#}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
