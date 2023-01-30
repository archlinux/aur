# Maintainer: LSUtigers3131 
# Maintainer: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full-bin
_pkgname=libpamac
pkgver=11.4.1
pkgrel=1
epoch=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak and snap support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'flatpak' 'snapd' 'snapd-glib' 'archlinux-appstream-data-pamac')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc' 'lrzip')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-flatpak' 'libpamac' 'libpamac-full-git')
source=("${_pkgname}-${pkgver}.tar.lrz")
sha256sums=('0cdec1a8c985537dd3f8aad0b1595f506f9fba432861ac6662e5b8feaf015fb4')

prepare() {
  rm -rf ${_pkgname}-${pkgver}
  lrzuntar ${_pkgname}-${pkgver}.tar.lrz
}
  
build() {
  cd ${_pkgname}-${pkgver}
  mkdir -p builddir
  cd builddir
  meson setup --prefix=/usr --sysconfdir=/etc -Denable-snap=true -Denable-flatpak=true --buildtype=release
  # build
  ninja
}

package() {
  backup=('etc/pamac.conf')
  cd ${_pkgname}-${pkgver}
  cd builddir
  DESTDIR="${pkgdir}" ninja install
}

#vim:set ts=2 sw=2 et:
