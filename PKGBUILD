# Maintainer: TommyTran732
# Contributor: Frederic Bezies <fredbezies@gmail.com> 

pkgname=libpamac-flatpak
_pkgname=libpamac
pkgver=11.0.1
pkgrel=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak and support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'flatpak' 'archlinux-appstream-data-pamac')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
conflicts=('libpamac' 'libpamac-aur' 'libpamac-full')
source=(https://gitlab.manjaro.org/applications/libpamac/-/archive/$pkgver/libpamac-$pkgver.tar.bz2)
sha256sums=('b204d921ca17cbe79b8e46f829f1364c56d9c98cba42372d98c7a8d7f0a7bd6b')

build() {
  cd $_pkgname-$pkgver
  mkdir -p builddir
  cd builddir
  meson setup --prefix=/usr --sysconfdir=/etc -Denable-flatpak=true --buildtype=release
  ninja
}

package() {
  backup=('etc/pamac.conf')
  cd $_pkgname-$pkgver
  cd builddir
  DESTDIR="$pkgdir" ninja install
}
