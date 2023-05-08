# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=4.2.0
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://codeberg.org/WhyNotHugo/caffeine-ng"
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
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
source=("caffeine-ng-$pkgver.tar.gz::https://codeberg.org/attachments/6da08199-604f-4f0f-b9dd-c50efe587965")

sha512sums=('ff732b56baa96f9f8eb0d05b502c56612cbd5a9c48c65820724c3abbb9ad4e2770997285cb0e4a1617cc5c70c8881a015451b4c00a6513daada97b93920a2cf8')

build() {
  cd "$srcdir/caffeine-ng-v${pkgver}-0-g5027f55"
  arch-meson . build
  meson compile -C build
}

check() {
  cd "$srcdir/caffeine-ng-v${pkgver}-0-g5027f55"
  meson test --no-rebuild --print-errorlogs -C build
}

package() {
  cd "$srcdir/caffeine-ng-v${pkgver}-0-g5027f55"
  DESTDIR="$pkgdir" meson install --no-rebuild -C build
}
