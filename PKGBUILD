# Maintainer: Haoran Ma <1399898323@qq.com>

pkgname=caffeine-ng-regex
pkgver=4.2.0
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://codeberg.org/0xcccccccccccc/caffeine-ng-regex"
license=("GPL-3.0-or-later")
depends=(
  python-gobject
  python-xdg
  python-dbus
  python-click
  python-ewmh
  gtk3
  libnotify
  python-setproctitle
  python-wheel
  python-pulsectl
  libindicator-gtk3
  libayatana-appindicator
)
optdepends=(
  # "libappindicator-gtk3: AppIndicator support (eg: Plasma, Unity)."
  "xfconf: Support for Xfce presentation mode."
)
makedepends=(
  git
  meson
  scdoc
)
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray caffeine-ng)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
source=("caffeine-ng-$pkgver.tar.gz::https://codeberg.org/0xcccccccccccc/caffeine-ng-regex/archive/main.tar.gz")
sha512sums=('SKIP')

build() {
  cd "$srcdir/caffeine-ng-regex"
  arch-meson . build
  meson compile -C build
}

check() {
  cd "$srcdir/caffeine-ng-regex"
  meson test --no-rebuild --print-errorlogs -C build
}

package() {
  cd "$srcdir/caffeine-ng-regex"
  DESTDIR="$pkgdir" meson install --no-rebuild -C build
}
