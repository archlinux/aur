# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=hashit-git
pkgver=1.0.0.r2.gaee4f09
pkgrel=1
pkgdesc="Checksum tool for Pantheon, developed by Artem Anufrij"
arch=('x86_64')
url='https://artemanufrij.github.io/'
license=('GPL3')
depends=('libgranite.so' 'gtk3')
makedepends=('vala' 'meson' 'ninja' 'git')
provides=(hashit)
conflicts=(hashit)
source=("${pkgname}::git+https://github.com/artemanufrij/hashit.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  install -d build
}

build() {
  cd "${srcdir}/${pkgname}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
