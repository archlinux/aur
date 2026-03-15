# Maintainer: Szymon Morawski <szymorawski@gmail.com>
pkgname=soulfu-git
pkgver=1.x.BFTD
pkgrel=2
pkgdesc="A fork of a 3D action role-playing hack and slash dungeon crawler by Aaron Bishop"
arch=('x86_64')
url="https://github.com/szymor/soulfu"
license=('GPL2')
depends=('sdl2-compat' 'sdl_net' 'libogg' 'libjpeg-turbo' 'libvorbis' 'libglvnd' 'glibc')
makedepends=('git' 'gcc' )
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
  install -D -m644 packaging/icons/hicolor/16x16/apps/soulfu.png "$pkgdir/usr/share/icons/hicolor/16x16/apps/soulfu.png"
  install -D -m644 packaging/icons/hicolor/24x24/apps/soulfu.png "$pkgdir/usr/share/icons/hicolor/24x24/apps/soulfu.png"
  install -D -m644 packaging/icons/hicolor/32x32/apps/soulfu.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/soulfu.png"
  install -D -m644 packaging/icons/hicolor/48x48/apps/soulfu.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/soulfu.png"
  install -D -m644 packaging/icons/hicolor/64x64/apps/soulfu.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/soulfu.png"
  install -D -m644 packaging/icons/hicolor/96x96/apps/soulfu.png "$pkgdir/usr/share/icons/hicolor/96x96/apps/soulfu.png"
  install -D -m644 packaging/icons/hicolor/128x128/apps/soulfu.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/soulfu.png"

  # desktop entry
  install -D -m644 packaging/soulfu.desktop "$pkgdir/usr/share/applications/soulfu.desktop"

  # executable
  install -D -m755 soulfu "$pkgdir/usr/bin/soulfu"

  # data archive (rw permissions needed!)
  install -D -m666 datafile.sdf "$pkgdir/usr/share/soulfu/datafile.sdf"
}