# Maintainer: Frederic Bezies <fredbezies at gmail dot com> 

pkgname=libpamac-git
_pkgname=libpamac
pkgver=1.5.2.r2.g57bef1e
pkgrel=1
pkgdesc="Library for Pamac package manager based on libalpm - git version"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'appstream-glib' 'polkit' 'archlinux-appstream-data-pamac' 'libsoup3')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc' 'git')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-full' 'libpamac-full-dev' 'libpamac')
source=(git+https://gitlab.manjaro.org/applications/libpamac.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

build() {
  cd $_pkgname
  mkdir -p builddir
  cd builddir
  meson setup --prefix=/usr --sysconfdir=/etc --buildtype=release
  # build
  ninja
}

package() {
  backup=('etc/pamac.conf')
  cd $_pkgname
  cd builddir
  DESTDIR="$pkgdir" ninja install
}

#vim:set ts=2 sw=2 et:
