# Maintainer: Forest Crossman <cyrozap at gmail dot com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>
# Contributor: Bolivar Stephen <bolivar.stephen@gmail.com>

_name=twmn
pkgname="${_name}-git"
pkgver=187.80f4883
pkgrel=1
pkgdesc="A notification system for tiling window managers"
arch=('any')
url="https://github.com/sboli/twmn"
license=('LGPL3')
provides=('notification-daemon')
depends=('qt5-base' 'qt5-x11extras' 'boost-libs>=1.46' 'libxext' 'libxkbcommon-x11')
makedepends=('git' 'pkg-config' 'boost>=1.46')
conflicts=('twmn')
source=("${_name}::git+https://github.com/sboli/${_name}.git")
sha256sums=('SKIP')

pkgver() {
   cd "${_name}"
   echo "$(git rev-list --count HEAD).$(git describe --always )"
}

build() {
   cd "${_name}"
   qmake-qt5
   make
}

package() {
   install -Dm755 "${_name}/bin/${_name}c" "${pkgdir}/usr/bin/${_name}c"
   install -Dm755 "${_name}/bin/${_name}d" "${pkgdir}/usr/bin/${_name}d"
   install -Dm644 "${_name}/init/systemd/${_name}d.service" "${pkgdir}/usr/lib/systemd/user/${_name}d.service"
}
