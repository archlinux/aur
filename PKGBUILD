# Maintainer: alba4k <blaskoazzolaaaron[at]gmail.com>

_pkgname="fluxcast"
pkgname="$_pkgname-git"
pkgver=0.1.4.r0.gab9d183
pkgrel=1
pkgdesc="Stream your Linux desktop to a Smart TV via Miracast/WFD, DLNA, or Cast"
arch=('any')
url="https://github.com/IlyaP358/fluxcast"
license=('GPL-3.0')
install=fluxcast.install

depends=(
  dnsmasq
  ffmpeg
  glib2
  gst-plugins-bad
  gst-plugins-good
  gst-python
  gstreamer
  iw
  libpulse
  networkmanager
  python-gobject
  wpa_supplicant
)
optdepends=(
  'python-dbus-next: WFD portal capture control plane for KDE/GNOME Wayland'
  'python-pychromecast: Needed for the Cast protocol'
  'python-upnpclient: Needed for the DLNA protocol'
  'wf-recorder: Hyprland/wlroots screen capture'
  'xdg-desktop-portal: Wayland portal service for KDE/GNOME capture'
  'python-pystray: System tray interface'
  'python-pillow: Tray icon rendering'
  'tk: About window'
  'libnotify: Desktop notifications'
  'libappindicator: Tray backend for Hyprland/KDE'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$_pkgsrc/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$_pkgsrc/documentation/DOCUMENTATION.md" -t "$pkgdir/usr/share/doc/$pkgname/documentation/"

  env SRCDIR="$_pkgsrc" DESTDIR="$pkgdir" "$_pkgsrc/meta/install.sh"
}

