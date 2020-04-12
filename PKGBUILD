# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=imageburner-git
pkgver=1.0.2.r12.g84f44e0
pkgrel=1
pkgdesc="Image burner for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url='https://artemanufrij.github.io/'
license=('GPL3')
depends=(libgranite.so gtk3)
makedepends=(vala meson ninja git)
provides=(imageburner)
conflicts=(imageburner)
source=("${pkgname}::git+https://github.com/artemanufrij/imageburner.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -s /usr/bin/com.github.artemanufrij.imageburner "$pkgdir/usr/bin/imageburner"
}
