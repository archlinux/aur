# Maintainer: Dmitry Lyashuk <lyashuk.voxx at gmail dot com>
pkgname=flatwaifu
_pkgver_base=1.35
pkgver=1.35.r197.a46dd0e
pkgrel=1
pkgdesc="Doom-themed platformer by Prikol Software, a modern port made by DeaDDooMER"
arch=(x86_64 i686)
url="https://doom2d.org/"
license=('GPL3')
depends=(doom2d-res sdl2 openal libgl)
makedepends=(git cmake gcc)
provides=(doom2d)
conflicts=(doom2d-rembo doom2d-vcd)
source=(
  'git://repo.or.cz/flatwaifu.git'
  'd2d.1.gz'
  'doom2d.desktop'
  'doom2d.png'
  'doom2d.sh'
)
noextract=(
  'd2d.1.gz'
)
md5sums=(
  'SKIP'
  '1ab0cf558d58d98ace7d852e97b3ba7a'
  'd5443a7a6431a9ad29e68b597219201e'
  '9e3f78a5f7d779b4050bc7e7659822f4'
  '0c92ce494d887acf4e9199368d9b2456'
)
options=(
  !strip
)
install=doom2d.install

pkgver() {
  cd "$srcdir"/flatwaifu
  printf "$_pkgver_base.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir"/flatwaifu/src
   mkdir build 
   cd build
   cmake -DSYSTEM_DRIVER=SDL2 -DRENDER_DRIVER=OPENGL -DSOUND_DRIVER=OPENAL ..
   make
}


package() {
  cd "$srcdir"/flatwaifu/src/build
  install -Dm755 doom2d "$pkgdir"/usr/bin/doom2d
  
  cd ../../..
  install -Dm644 doom2d.desktop "$pkgdir"/usr/share/applications/doom2d.desktop
  install -Dm644 doom2d.png "$pkgdir"/usr/share/pixmaps/doom2d.png
  install -Dm755 doom2d.sh "$pkgdir"/usr/share//doom2d/doom2d.sh
  install -Dm644 d2d.1.gz "$pkgdir"/usr/share/man/man1/d2d.1.gz
}
