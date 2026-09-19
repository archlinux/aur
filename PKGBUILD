# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=convey
pkgver=50.2
pkgrel=1
pkgdesc="Email application built around conversations for the GNOME desktop."
arch=('x86_64')
url="https://gitlab.gnome.org/donnybeelo/convey"
license=(
  'CC-BY-3.0'
  'CC-BY-SA-3.0'
  'LGPL-2.1-or-later'
)
depends=(
  'evolution-data-server'
  'enchant'
  'folks'
  'gcr-4'
  'gmime3'
  'gnome-online-accounts'
  'gst-plugins-bad-libs'
  'gstreamer'
  'gtk4'
  'icu'
  'iso-codes'
  'json-glib'
  'libadwaita'
  'libgee'
  'libgoa'
  'libical'
  'libpeas-2'
  'libsecret'
  'libsoup3'
  'libstemmer'
  'libunwind'
  'libxml2'
  'libytnef'
  'org.freedesktop.secrets'
  'snowball'
  'sqlite'
  'webkitgtk-6.0'
)
makedepends=(
  'gobject-introspection'
  'itstool'
  'meson'
  'vala'
)
checkdepends=(
  'appstream'
  # 'aspell'
  'desktop-file-utils'
  # 'hspell'
  # 'hunspell'
  # 'libvoikko'
  # 'nuspell'
  # 'xorg-server-xvfb'
)
conflicts=('geary')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ffd8bbace9e4f23003f47278b8506009ac81a637852ba55fe5fe6d3f84e99116')

build() {
  arch-meson "$pkgname-$pkgver" build -Dprofile=release
  meson compile -C build
}

check() {
  # export LIBGL_ALWAYS_SOFTWARE=1
  # xvfb-run -a dbus-run-session -- meson test -C build --no-stdsplit --no-rebuild --print-errorlogs

  appstreamcli validate --no-net build/desktop/net.donnybeelo.Convey.metainfo.xml
  desktop-file-validate build/desktop/*.desktop
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
