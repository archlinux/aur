# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng-git
_pkgname=caffeine-ng
pkgver=v4.0.2.r5.gc7b1800
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://codeberg.org/WhyNotHugo/caffeine-ng"
license=(GPL3)
depends=(
  python-gobject
  python-xdg
  dbus-python
  python-click
  python-ewmh
  gtk3
  libnotify
  python-setproctitle
  python-pulsectl
  libindicator-gtk3
  libappindicator-gtk3
)
makedepends=(
  git
  meson
)
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
source=("git+https://codeberg.org/WhyNotHugo/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  arch-meson build
  meson compile -C build
}

check() {
  cd "$srcdir/$_pkgname"
  meson test -C build
}

package() {
  cd "$srcdir/$_pkgname"
  meson install -C build --destdir "$pkgdir"
}
