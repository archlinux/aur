# Maintainer: Illia Pukalov <illia@fluxcast.dev>
# Contributor: alba4k <blaskoazzolaaaron[at]gmail.com>

pkgname=fluxcast
pkgver=0.2.6
pkgrel=1
pkgdesc="Stream your Linux desktop to a Smart TV via Miracast/WFD, DLNA, or Cast"
arch=('any')
url="https://github.com/IlyaP358/fluxcast"
license=('GPL-3.0-or-later')
depends=(
  dnsmasq
  ffmpeg
  glib2
  gst-plugin-pipewire
  gst-plugins-bad
  gst-plugins-base
  gst-plugins-good
  gst-plugins-ugly
  gst-python
  gstreamer
  iw
  libappindicator
  libnotify
  libpulse
  networkmanager
  python-dbus-next
  python-gobject
  python-pillow
  python-pystray
  tk
  wf-recorder
  wpa_supplicant
  xdg-desktop-portal
  xorg-xrandr
)
optdepends=(
  'python-pychromecast: Needed for the Cast protocol'
  'python-upnpclient: Needed for the DLNA protocol'
)
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b5511645e3f8995624939d5d490e06b21691e157d14e731c7895e372da66b2f')

package() {
  cd "$pkgname-$pkgver"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 documentation/DOCUMENTATION.md \
    -t "$pkgdir/usr/share/doc/$pkgname/documentation/"

  env DESTDIR="$pkgdir" FLUXCAST_VERSION="$pkgver" ./meta/install.sh

  sed -i "s|^__installed_version__ = \"dev\"|__installed_version__ = \"$pkgver\"|" \
    "$pkgdir/opt/fluxcast/version.py"
}
