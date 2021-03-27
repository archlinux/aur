# Maintainer: Andrew Lin <andrewlin16@gmail.com>

pkgname=vgmplay-libvgm-git
pkgver=0.50.1.r24.g6480d3e
pkgrel=1
pkgdesc="A new VGMPlay, based on libvgm"
arch=('x86_64')
url="https://github.com/ValleyBell/vgmplay-libvgm"
license=('GPL')
source=(
  "git://github.com/ValleyBell/vgmplay-libvgm.git"
  "git://github.com/benhoyt/inih.git"
  "git://github.com/alex85k/wingetopt.git"
)
depends=('libvgm-player-git' 'libvgm-emu-git' 'libvgm-utils-git' 'libvgm-audio-git')
makedepends=('cmake' 'git')
conflicts=('vgmplay')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.inih.url "$srcdir/inih"
  git config submodule.wingetopt.url "$srcdir/wingetopt"
  git submodule update
}

build() {
  cd "${pkgname%-git}"
  cmake .
  make
}

package() {
  cd "${pkgname%-git}"
  install -d -m755 "$pkgdir/usr/bin"
  install -m755 vgmplay "$pkgdir/usr/bin/vgmplay"
  install -d -m755 "$pkgdir/usr/share/vgmplay"
  install -m644 VGMPlay.ini "$pkgdir/usr/share/vgmplay/VGMPlay.ini"
}

# vim:set ts=2 sw=2 et:
