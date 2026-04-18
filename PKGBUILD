# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=4.3.2
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
#source=("https://codeberg.org/WhyNotHugo/caffeine-ng/releases/download/v${pkgver}/caffeine-ng-v${pkgver}.tar.gz")
# As per AUR comment from upstream author, tagged versions can be considered "releases"
source=("https://codeberg.org/WhyNotHugo/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('5b74773b53a76df431145dcc01466b3648f727e1d35cf6dde216e07b6b5a1ec97a7325f9f8c02bd188f5aa17b89aa55ce68bfb6b63a1e8bf4676383314749158')

build() {
  cd "$srcdir/caffeine-ng"
  arch-meson . build
  meson compile -C build
}

check() {
  cd "$srcdir/caffeine-ng"
  meson test --no-rebuild --print-errorlogs -C build
}

package() {
  cd "$srcdir/caffeine-ng"
  DESTDIR="$pkgdir" meson install --no-rebuild -C build
}
