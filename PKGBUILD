# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=4.3.0
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
source=("https://codeberg.org/WhyNotHugo/caffeine-ng/releases/download/v${pkgver}/caffeine-ng-v${pkgver}.tar.gz")

sha512sums=('f014e1a48f83f70000b4fefd05ddf48cc0a7777b06cb05f653653c45d0a84cdf037fad070d56023801ea29ecd89f326fccb30abf8609c9028200178fb032b094')

build() {
  cd "$srcdir/caffeine-ng-v${pkgver}"
  arch-meson . build
  meson compile -C build
}

check() {
  cd "$srcdir/caffeine-ng-v${pkgver}"
  meson test --no-rebuild --print-errorlogs -C build
}

package() {
  cd "$srcdir/caffeine-ng-v${pkgver}"
  DESTDIR="$pkgdir" meson install --no-rebuild -C build
}
