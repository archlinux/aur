# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

makedepends=('cmake' 'glib2' 'git')

_pkgbase=vala-panel-appmenu
pkgname=vala-panel-appmenu-registrar-git
_path=subprojects/registrar
pkgver=0.6.93.r0.g553ce49
pkgrel=1
pkgdesc="Small utility to hold DBusMenu menus"
provides=(vala-panel-appmenu-registrar)
depends=('glib2')
url="https://github.com/rilian-la-te/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('LGPL3')

source=("git://github.com/rilian-la-te/${_pkgbase}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgbase}/${_path}"
  cmake ./ "${_opts[@]}"
  make
}

package()
{
  cd "${srcdir}/${_pkgbase}/${_path}"
  make DESTDIR="${pkgdir}" install
}
