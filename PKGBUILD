# Maintainer: Josef Vybíhal <josef.vybihal@gmail.com>
# Contributor: TingPing tingping@tingping.se

#  shellcheck disable=SC2034
pkgname=transmission-remote-gtk-git
pkgver=1.6.0.r16.g14b8613
pkgrel=1
pkgdesc='A remote interface to the Transmission BitTorrent client'
arch=('i686' 'x86_64' 'armv6h')
url='https://github.com/transmission-remote-gtk/transmission-remote-gtk'
license=('GPL')
options=('!libtool')
depends=('gtk3' 'libsoup3' 'json-glib' 'gettext')
makedepends=('git' 'appstream-glib' 'meson' 'desktop-file-utils' 'python-docutils')
optdepends=(
  'libayatana-indicator: Application tray support'
)
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
