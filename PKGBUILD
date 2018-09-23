# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh-git
pkgver=1.3.4.r5.g75b6765
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja git)
provides=(easyssh)
conflicts=(easyssh)
source=("${pkgname}::git+${url}.git" 0001-fix-vte-build-error.patch)
sha256sums=('SKIP'
            '1be1e1f1d654eafb31972320f1c94a17b7f35c4e938ceba8b6da122ab459cb48')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  patch -p1 -i ../0001-fix-vte-build-error.patch
}

build() {
  cd "${pkgname}"
  meson build --prefix=/usr -D libunity=false
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
