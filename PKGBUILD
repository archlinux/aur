# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Previous Maintainer: TingPing tingping@tingping.se

pkgname=transmission-remote-gtk-git
pkgver=1.4.2.r67.g821007c
pkgrel=1
pkgdesc='A remote interface to the Transmission BitTorrent client'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/transmission-remote-gtk/transmission-remote-gtk'
license=('GPL')
options=('!libtool')
depends=('gtk3' 'curl' 'libproxy' 'geoip')
makedepends=('git' 'appstream-glib' 'meson' 'desktop-file-utils' 'perl')
provides=('transmission-remote-gtk')
conflicts=('transmission-remote-gtk')
source=('git+https://github.com/transmission-remote-gtk/transmission-remote-gtk.git')
sha512sums=('SKIP')
_gitname='transmission-remote-gtk'

pkgver() {
  cd "$_gitname"

  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
  meson setup build "$_gitname" --prefix=/usr
}

build() {
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
