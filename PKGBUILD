# Maintainer: rilian-la-te <ria.freelander@gmail.com>

_opts=(
	-DCMAKE_INSTALL_PREFIX=/usr
	-DCMAKE_INSTALL_LIBDIR=lib
	-DCMAKE_INSTALL_LIBEXECDIR=lib
)

makedepends=('cmake' 'glib2' 'libdbusmenu-glib' 'libxkbcommon' 'java-environment>=7' 'git')

_pkgbase=vala-panel-appmenu
pkgname=vala-panel-appmenu-jayatana-git
_path=subprojects/jayatana
pkgver=0.7.3
pkgrel=1
pkgdesc="AppMenu module for Java Applications. Contains Bugs!"
provides=(jayatana)
depends=('glib2' 'libdbusmenu-glib' 'libxkbcommon' 'java-environment>=11')
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('MIT')

source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git")
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
