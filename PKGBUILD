# Maintainer: Senya <senya at riseup.net>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Bruno Pagani <archange@archlinux.org>

pkgname=jami-gnome-git
pkgver=1.0.0.r773.g50fc0a5
pkgrel=1
pkgdesc="Free and universal communication platform which preserves the users’ privacy and freedoms (GNOME client)"
arch=(x86_64)
url="https://jami.net"
license=(GPL3)
groups=(jami)
depends=(libjamiclient-git jami-daemon-git
         gtk3 dconf clutter clutter-gtk webkit2gtk qrencode qt5-base
         gtk-update-icon-cache desktop-file-utils libnotify libcanberra libnm)
makedepends=(git cmake)
provides=(ring-gnome)
conflicts=(ring-gnome jami-gnome)
replaces=(ring-gnome)
source=(
  "git+https://git.jami.net/savoirfairelinux/ring-client-gnome.git"
  "git+https://git.jami.net/savoirfairelinux/ring-lrc.git"
)
md5sums=(SKIP SKIP)

pkgver() {
  cd ring-client-gnome
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
  mv ring-lrc lrc
}

build() {
  cd build
  cmake ../ring-client-gnome \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
