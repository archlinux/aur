# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=upwork-wayland
pkgver=20250925.143605
pkgrel=2
pkgdesc='Allows Upwork screenshots to work under Wayland by replacing its GDK API calls'
arch=('x86_64')
url='https://github.com/tiesselune/upwork-wayland'
license=('GPL-3.0-or-later')
depends=(
  'flameshot'
  'gdk-pixbuf2'
  'glib'
  'libx11'
  'upwork'
)
makedepends=('gcc' 'git' 'make' 'pkgconf')
options=(!buildflags !debug !makeflags !strip)
source=("git+$url.git" 'upwork-wayland.desktop')
b2sums=('SKIP'
        '00939efb06bc71995d9a5c66dc5062f5eda82abf1e7e2b5e5e4054812ad993816f673cd9892113969a7d27de79982db3caf20cd523106565bafe6c923b1cabcb')

build() {
  cd upwork-wayland
  sed -i -E 's|=.+/gdk-screenshotter.so|=/usr/lib/upwork-wayland/gdk-screenshotter.so|' upwork.sh
  make
}

package() {
  install -Dm755 "$srcdir/upwork-wayland/gdk-screenshotter.so" "$pkgdir/usr/lib/upwork-wayland/gdk-screenshotter.so"
  install -Dm755 "$srcdir/upwork-wayland/upwork.sh" "$pkgdir/usr/bin/upwork-wayland"
  install -Dm644 "$srcdir/upwork-wayland.desktop" "$pkgdir/usr/share/applications/upwork-wayland.desktop"
}
