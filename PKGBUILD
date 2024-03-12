# Maintainer: WhitedonSAP <ayrtonarantes0987654321ayrt008 at gmail dot com> 

pkgname=libpamac
pkgver=11.6.4
pkgrel=1
pkgdesc="Library for Pamac package manager based on libalpm"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman-git' 'appstream-glib' 'polkit' 'archlinux-appstream-data')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-full')
source=(https://gitlab.manjaro.org/applications/libpamac/-/archive/$pkgver/libpamac-$pkgver.tar.bz2)
sha256sums=('4ac54679e25004d6af8154340bac2e060c3a109a6bcb336f54ce025b2d68f080')

build() {
  cd $pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  meson setup --prefix=/usr --sysconfdir=/etc --buildtype=release
  # build
  ninja
}

package() {
  backup=('etc/pamac.conf')
  cd $pkgname-$pkgver
  cd builddir
  DESTDIR="$pkgdir" ninja install
}
