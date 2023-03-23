# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=doom2d-rembo
pkgver=1.35
pkgrel=1
pkgdesc="Doom-themed platformer by Prikol Software, a modern port made by Rembo"
arch=(x86_64 i686)
url="https://doom2d.org/"
license=('GPL3')
depends=(doom2d-res sdl sdl_mixer libgl)
makedepends=(git cmake gcc)
provides=(doom2d)
conflicts=(flatwaifu doom2d-vcd)
source=(
  'git+https://github.com/Doom2D/doom2d-rembo.git'
  'd2d_rembo.1.gz'
  'doom2d.desktop'
  'doom2d.png'
  'doom2d.sh'
)
noextract=(
  'd2d_rembo.1.gz'
)
md5sums=(
  'SKIP'
  '9bf5e3f3489fa2ba0e6da9dd193da749'
  '045e4e63fdcc5f6dddb7cc396eab16ee'
  '9e3f78a5f7d779b4050bc7e7659822f4'
  '0c92ce494d887acf4e9199368d9b2456'
)
options=(
  !strip
)
install=doom2d.install

build() {
  cd "$srcdir"/doom2d-rembo/src
   mkdir build 
   cd build
   cmake ..
   make
}


package() {
  cd "$srcdir"/doom2d-rembo/src/build
  install -Dm755 doom2d "$pkgdir"/usr/bin/doom2d
  
  cd ../../..
  install -Dm644 doom2d.desktop "$pkgdir"/usr/share/applications/doom2d.desktop
  install -Dm644 doom2d.png "$pkgdir"/usr/share/pixmaps/doom2d.png
  install -Dm755 doom2d.sh "$pkgdir"/usr/share//doom2d/doom2d.sh
  install -Dm644 d2d_rembo.1.gz "$pkgdir"/usr/share/man/man1/d2d.1.gz
}
