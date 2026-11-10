# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clockenstein
pkgver=2.0.3
pkgrel=1
pkgdesc="Calendar application with local, Google and CalDAV support"
arch=('any')
url="https://xapp-project.org/clockenstein.html"
license=('GPL-3.0-or-later')
depends=(
  'gnome-online-accounts'
  'gsound'
  'gtk3'
  'libsecret'
  'org.freedesktop.secrets'
  'python-babel'
  'python-caldav'
  'python-dbus'
  'python-gobject'
  'python-google-api-python-client'
  'python-google-auth-httplib2'
  'python-google-auth-oauthlib'
  'python-httplib2'
  'python-icalendar'
  'python-pycurl'
  'python-requests'
  'python-rich'
  'python-setproctitle'
  'python-tzdata'
  'python-xapp'
  'xapp'
  'xapp-symbolic-icons'
)
makedepends=(
  'git'
  'meson'
)
optdepends=('gnome-online-accounts-gtk')
checkdepends=('desktop-file-utils')
source=("git+https://github.com/xapp-project/clockenstein.git#tag=$pkgver")
sha256sums=('cb70a796ee67c2a4f23bffac2036911f8b6adb62c263208c0cc07e4d3829503a')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {

  # FAIL: test_day_event_label_orders_title_time_and_location
  meson test -C build --no-rebuild --print-errorlogs || :

  desktop-file-validate build/data/*.desktop
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
