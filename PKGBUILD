# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng-git
_pkgname=caffeine-ng
pkgver=4.2.0.r34.g1c638ba
pkgrel=2
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://codeberg.org/WhyNotHugo/caffeine-ng"
license=(GPL3)
depends=('python' 'python-click' 'python-dbus' 'python-ewmh' 'python-gobject' 'python-pulsectl' 'python-setproctitle' 'gtk3' 'libnotify' 'libayatana-appindicator' 'libayatana-indicator' 'xdg-utils')
makedepends=('git' 'meson' 'scdoc')
optdepends=('xfconf' 'libindicator-gtk3' 'libappindicator-gtk3')
conflicts=('caffeine' 'caffeine-bzr' 'caffeine-ng' 'caffeine-ng-regex')
provides=('caffeine' 'caffeine-bzr' 'caffeine-ng' 'caffeine-ng-regex')
source=("git+https://codeberg.org/WhyNotHugo/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
