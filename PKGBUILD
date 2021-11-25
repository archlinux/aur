# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh-git
pkgver=1.7.7.r7.gfe585c9e
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=(x86_64)
url="https://github.com/muriloventuroso/easyssh"
license=(GPL3)
depends=(libgranite.so gtk3 vte3)
makedepends=(vala meson ninja git)
provides=(easyssh)
conflicts=(easyssh)
source=("git+https://github.com/muriloventuroso/easyssh.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  meson build --prefix=/usr -D ubuntu-bionic-patched-vte=false -D patched-vte=true
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.muriloventuroso.easyssh "${pkgdir}/usr/bin/easyssh"
}
