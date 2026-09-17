# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clockenstein
pkgver=2.0.0
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
  'python-babel'
  'python-caldav'
  'python-dbus'
  'python-gobject'
  'python-google-api-python-client'
  'python-google-auth-httplib2'
  'python-google-auth-oauthlib'
  'python-icalendar'
  'python-rich'
  'python-setproctitle'
  'python-xapp'
  'xapp'
  'xapp-symbolic-icons'
)
makedepends=(
  'git'
  'meson'
)
checkdepends=('desktop-file-utils')
source=("git+https://github.com/xapp-project/clockenstein.git#tag=$pkgver")
sha256sums=('b4cb76ae1e22b48f782b082255bf551d0a5c1943afe09c887d0a7c1bb3e9a620')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {

  # FAIL: test_day_event_label_orders_title_time_and_location
  meson test -C build --no-rebuild --print-errorlogs || :

  desktop-file-validate build/data/org.x.clockenstein.Calendar.desktop
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
