# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=progman
pkgver=1.0
pkgrel=1
pkgdesc='Simple X11 window manager modeled after the Windows 3 era'
arch=(x86_64)
url='https://github.com/jcs/progman'
license=(MIT)
depends=(
  gdk-pixbuf-xlib
  gdk-pixbuf2
  glib2
  glibc
  libx11
  libxext
  libxft
  libxpm
)
makedepends=(
  git
  vim
)
source=(
  "git+https://github.com/jcs/progman.git#tag=v$pkgver"
  progman.desktop
)
b2sums=(
  965fa8d7206d3c78e348998be14e69bfc5c7341048db85759ef3687c9f0f1d98a41aca36a22989face6550b9c09246a2efbaee302ed5aeb6cb135e2e5aa0c7cb
  75c97ad25bf26ba69f887582f98d63ce7c79c9bc78ad6ef59e73b7a46d453fb840c5339ccac89cf3026c795e41997a7e6ffafcedd5d4ffabca63559cad33431e
)

prepare() {
  cd $pkgname

  # Do not strip binaries on install so we can get debuginfo
  sed -i 's/install -s/install -p/' Makefile
}

build() {
  cd $pkgname
  make
}

package () {
  cd $pkgname
  make PREFIX="$pkgdir/usr" install
  install -Dm644 -t "$pkgdir/usr/share/xsessions" ../progman.desktop
  install -Dm644 -t "$pkgdir/usr/share/progman" progman.ini
  install -Dm644 -t "$pkgdir/usr/share/licenses/progman" LICENSE
}
