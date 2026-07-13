# Maintainer: Twilight0 <twilight0@vivaldi.net>
pkgname=respite
pkgver=1.2.2
pkgrel=1
pkgdesc="A GTK3 media player (fork of Parole, Xfce deps removed)"
arch=('x86_64')
url="https://github.com/Twilight0/respite"
license=('GPL-2.0-or-later')
depends=(
  'dbus-glib'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk3'
  'taglib'
  'xapp'
)
makedepends=(
  'meson'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gtk3'
  'taglib'
  'libnotify'
  'xapp'
)
optdepends=(
  'libnotify: desktop notifications plugin'
  'gst-plugins-ugly: additional codec support'
  'gst-plugins-bad: additional codec support'
  'gst-libav: ffmpeg/libav decoder support'
  'yt-dlp: streaming URL support (YouTube, Dailymotion, Rumble, Odysee, Vimeo, Reddit, BiliBili, Archive.org, Twitch)'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Twilight0/respite/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92bae08ac68044c1e2fcc4e0ac8c3cc1024cd76948ca204882325601b9d198be')

build() {
  cd "${pkgname}-${pkgver}"
  meson setup build --prefix=/usr
  meson compile -C build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" meson install -C build
}

post_install() {
  update-desktop-database -q "$pkgdir/usr/share/applications" >/dev/null
  gtk-update-icon-cache -q -t -f "$pkgdir/usr/share/icons/hicolor" >/dev/null
}

post_upgrade() {
  update-desktop-database -q "$pkgdir/usr/share/applications" >/dev/null
  gtk-update-icon-cache -q -t -f "$pkgdir/usr/share/icons/hicolor" >/dev/null
}
