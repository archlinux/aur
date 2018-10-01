# Maintainer: Ysblokje <ysblokje at gmail dot com>
pkgname=('gamemode-git')
_pkgname=('gamemode')
pkgver=r120.0d179e5
pkgrel=1
pkgdesc="A daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS."
arch=('x86_64')
url="https://github.com/FeralInteractive/gamemode.git"
license=('BSD 3-Clause License (Revised)')
depends=('polkit')
optdepends=('systemd')
makedepends=('meson' 'ninja' 'pkg-config' 'git')
provides=('gamemode')
source=("git+https://github.com/FeralInteractive/gamemode.git")
sha256sums=('SKIP')

pkgver() {
    cd gamemode
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  arch-meson ${_pkgname} build -Dwith-systemd-user-unit-dir=/usr/lib/systemd/user
  ninja -C build
}

package() {
  DESTDIR=$pkgdir ninja -C build install
  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" ${_pkgname}/LICENSE.txt
}
