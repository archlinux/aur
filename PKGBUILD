# Maintainer: artist for Artix Linux

pkgname=batticonplus-ayatana-git
_pkgname=batticonplus
pkgver=2.0.0.r0.g9a050a0
pkgrel=1.1
pkgdesc='Lightweight battery icon for the system tray and notifier, wayland git version (based on cbatticon)'
arch=(x86_64)
url='https://github.com/artist4xlibre'
license=(GPL2)
makedepends=(libayatana-appindicator git)
depends=(libnotify gtk3)
conflicts=(batticonplus batticonplus-git batticonplus-ayatana cbatticon)
source=("git+${url}/${_pkgname}.git")
validpgpkeys=('4CF0F66D9CEF47105E22DD0F73580DE2EDDFA6D6')   # artist for Artix Linux
sha256sums=('SKIP')
options=('!debug')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  make WITH_NOTIFY=1 WITH_GTK3=1 WITH_APPINDICATOR=1
}

package() {
  cd ${_pkgname}
  make DESTDIR="${pkgdir}" install
}

