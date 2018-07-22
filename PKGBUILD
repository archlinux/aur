# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=easyssh-git
pkgver=1.2.7.r8.g1c2fdeb
pkgrel=1
pkgdesc="SSH connection manager for Pantheon"
arch=('x86_64')
url='https://github.com/muriloventuroso/easyssh'
license=('GPL3')
depends=('libgranite.so' 'gtk3')
makedepends=('vala' 'meson' 'ninja' 'git')
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
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
