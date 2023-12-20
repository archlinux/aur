# Maintainer: Szymon Morawski <szymorawski@gmail.com>
pkgname=soulfu-git
pkgver=1.x.BFTD
pkgrel=1
pkgdesc="A fork of a 3D action role-playing hack and slash dungeon crawler by Aaron Bishop"
arch=('x86_64')
url="https://github.com/szymor/soulfu"
license=('GPL2')
depends=('lib32-sdl12-compat' 'lib32-sdl_net' 'lib32-libogg' 'lib32-libjpeg-turbo' 'lib32-libvorbis' 'lib32-libglvnd' 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('git' 'gcc' 'sdl12-compat' 'sdl_net' 'libogg' 'libjpeg-turbo' 'libvorbis' 'libglvnd' 'glibc')
options=()
source=(git+https://github.com/szymor/soulfu.git)
md5sums=('SKIP')

prepare() {
  cd soulfu
  git submodule init
  git submodule update
}

build() {
  cd soulfu
  make release
}

package() {
  cd soulfu

  # icons
  install -D -m644 packaging/icons/hicolor/32x32/apps/soulfu.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/soulfu.png"

  # desktop entry
  install -D -m644 packaging/soulfu.desktop "$pkgdir/usr/share/applications/soulfu.desktop"

  # executable
  install -D -m755 soulfu "$pkgdir/usr/bin/soulfu"

  # data archive (rw permissions needed!)
  install -D -m666 datafile.sdf "$pkgdir/usr/share/soulfu/datafile.sdf"
}