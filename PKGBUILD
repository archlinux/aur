# Maintainer: TingPing tingping@tingping.se

pkgname=transmission-remote-gtk-git
pkgver=1.2.r37.g8fab1a3
pkgrel=1
pkgdesc='A remote interface to the Transmission BitTorrent client'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/transmission-remote-gtk/transmission-remote-gtk'
license=('GPL')
options=('!libtool')
depends=('gtk3' 'libnotify' 'curl' 'libproxy' 'geoip'
         'desktop-file-utils')
makedepends=('intltool' 'git' 'appstream-glib' 'autoconf-archive')
provides=('transmission-remote-gtk')
conflicts=('transmission-remote-gtk')
source=('git+https://github.com/transmission-remote-gtk/transmission-remote-gtk.git')
md5sums=('SKIP')
_gitname='transmission-remote-gtk'

pkgver() {
  cd "$_gitname"

  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"

  POD2MAN=/usr/bin/core_perl/pod2man ./autogen.sh --prefix=/usr --disable-debug --disable-desktop-database-update
  make -s
}

package() {
  cd "$_gitname"

  make DESTDIR="$pkgdir" install
}
