# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>
# Contributor: VitalyR <vitalyankh@gmail.com>
# Contributor: dr460nf1r3 <aur@dr460nf1r3.org>

# shellcheck disable=SC2034
_pkgname="gjs"
pkgname="${_pkgname}-git"
pkgver=1.73.2+23+ge78966e1
pkgrel=1
epoch=2
pkgdesc="Javascript Bindings for GNOME"
url="https://gitlab.gnome.org/GNOME/${_pkgname}/blob/master/doc/Home.md"
arch=('x86_64' 'i686' 'pentium4')
license=(GPL)
depends=('cairo' 'gobject-introspection-runtime' 'js102' 'dconf')
makedepends=('cmake' 'gobject-introspection' 'git' 'autoconf-archive' 'sysprof' 'meson')
checkdepends=('valgrind' 'xorg-server-xvfb')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://gitlab.gnome.org/GNOME/${_pkgname}.git/")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "${_pkgname}" build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

# shellcheck disable=SC2154
package() {
  DESTDIR="${pkgdir}" meson install -C build
}
