# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=bluray_info-git
pkgver=2.1.r0.g9165cbb
pkgrel=1
pkgdesc="Blu-ray utilities: bluray_info, bluray_copy, bluray_player"
arch=(x86_64)
url="https://github.com/beandog/bluray_info"
license=(GPL-2.0-only)
depends=(glibc libaacs libbluray mpv libmpv.so sh)
makedepends=(git cmake)
provides=(bluray_info)
conflicts=(bluray_info)
source=("git+https://github.com/beandog/bluray_info.git")
sha256sums=('SKIP')

pkgver() {
  cd bluray_info
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# Don't like modern cmake guidelines

build() {
  cd bluray_info

  cmake . -Wno-author \
	-DCMAKE_INSTALL_MANDIR=/usr/share \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd bluray_info
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/
  mv -v "${pkgdir}"/usr/man "${pkgdir}"/usr/share/
}
