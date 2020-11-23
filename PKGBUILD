# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
#
# Note that the upstream package creates the /usr/bin/jamm
# symlink in post_install, and hence does not remove it properly
# when it gets removed due to our conflicts entry.
pkgname=jamm-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Jamm is a lightweight video collaboration app for remote teams"
arch=("x86_64")
url="https://jamm.app/download"
license=("custom")
makedepends=("wget")
depends=(
  "c-ares" ffmpeg gtk3 http-parser libevent libvpx libxslt libxss
  minizip nss re2 snappy libnotify "libappindicator-gtk3"
)
provides=("jamm")
conflicts=("jamm")
DLAGENTS=("https::/usr/bin/wget --content-disposition %u")
source=(
  # -> "https://graffiti-app-one-tusk.s3-us-west-1.amazonaws.com/alpha/jamm-${pkgver}.pacman"
  "jamm-${pkgver}.pacman::https://jamm.app/api/download/pacman?channel=alpha"
)
sha256sums=(
  "224f2e492f39a09435bcd5d890d58f93f278cce4d1f48f8d5b28ef979d7d7279"
)

prepare() {
	# SUID chrome-sandbox for Electron 5+
	chmod 4755 $srcdir/opt/Jamm/chrome-sandbox
}

package() {
  cp -a $srcdir/opt $pkgdir
  cp -a $srcdir/usr $pkgdir
  mkdir $pkgdir/usr/bin
  ln -s /opt/Jamm/jamm $pkgdir/usr/bin/jamm
  echo
}
