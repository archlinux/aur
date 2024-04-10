# Maintainer: Cross Nastasi <cross@dill.moe>
pkgname=minetest-git-dill
pkgver=1.0
pkgrel=1
pkgdesc="Minetest from git"
arch=('x86_64')
url="https://github.com/minetest/minetest"
license=('GPL')
depends=(base-devel libcurl-gnutls cmake libpng sqlite libogg libvorbis openal freetype2 jsoncpp gmp luajit leveldb ncurses zstd gettext sdl2 gcc make git)
source=("git+${url}.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/minetest"
  cmake . -DCMAKE_BUILD_TYPE=Release -DRUN_IN_PLACE=FALSE -DCMAKE_INSTALL_PREFIX=/opt/minetest
  make -j$(( $(nproc) + 1 ))
}

package() {
  cd "${srcdir}/minetest"
  make DESTDIR="${pkgdir}" install
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/minetest/bin/minetest "${pkgdir}/usr/bin/minetest"
}