# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clockenstein
pkgver=1.0.0
pkgrel=1
pkgdesc="Calendar application with local, Google and CalDAV support"
arch=('any')
url="https://github.com/xapp-project/clockenstein"
license=('GPL-3.0-or-later')
depends=(
  'gnome-online-accounts'
  'gsound'
  'gtk3'
  'libsecret'
  'python-caldav'
  'python-dbus'
  'python-gobject'
  'python-google-api-python-client'
  'python-google-auth-httplib2'
  'python-google-auth-oauthlib'
  'python-icalendar'
  'python-setproctitle'
  'python-xapp'
  'xapp'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=('desktop-file-utils')
source=("git+https://github.com/xapp-project/clockenstein.git#tag=$pkgver")
sha256sums=('b8e61eb55cab32261b865e588560de0450b8f18d3f1ef904f79aa71558693df7')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs

  desktop-file-validate build/data/org.x.clockenstein.Calendar.desktop
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
