# Maintainer: TingPing tingping@tingping.se

pkgname=transmission-remote-gtk-git
pkgver=1.4.2.r27.g64a0250
pkgrel=1
pkgdesc='A remote interface to the Transmission BitTorrent client'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/transmission-remote-gtk/transmission-remote-gtk'
license=('GPL')
options=('!libtool')
depends=('gtk3' 'libnotify' 'curl' 'libproxy' 'geoip'
         'desktop-file-utils')
makedepends=('intltool' 'git' 'appstream-glib' 'meson')
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
  env POD2MAN=/usr/bin/core_perl/pod2man \
    meson setup build "$_gitname" --prefix=/usr
}

build() {
  meson compile -C build
}

package() {
  meson install -C build --destdir="$pkgdir"
}
