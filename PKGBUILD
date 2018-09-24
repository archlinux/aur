# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh-git
pkgver=1.3.4.r5.g75b6765
pkgrel=2
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja git)
provides=(easyssh)
conflicts=(easyssh)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  meson build --prefix=/usr -D libunity=false -D ubuntu-bionic-patched-vte=false
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
