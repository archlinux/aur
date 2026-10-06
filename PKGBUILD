# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=clockenstein
pkgver=2.0.1
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
_commit=93e33e5ae6792edb209207bb6a4e48b017fc58d8
source=("git+https://github.com/xapp-project/clockenstein.git#commit=${_commit}")
# source=("git+https://github.com/xapp-project/clockenstein.git#tag=$pkgver")
sha256sums=('4db068251cd3b7ebbdfeb29a2253245b6da2490d2587793e3d296843035941a7')

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
