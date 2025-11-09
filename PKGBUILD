# Contributor: Sanpi <sanpi+aur@homecomputing.fr>

pkgname=rpcs3-bin
_commit=8126a199f529e2bcd0025815fb9cffd0fa9fb700
pkgver=0.0.38_18315
pkgrel=1
pkgdesc='PlayStation 3 Emulator'
arch=('x86_64')
url=https://github.com/RPCS3/rpcs3-binaries-linux
license=('GPL-2.0-only')
depends=(
  'glew'
  'jack'
  'openal'
  'opencv'
  'qt6-base'
  'qt6-multimedia'
  'qt6-svg'
  'sdl3'
  'sndio'
)

optdepends=('libglvnd')
provides=(rpcs3)
conflicts=(rpcs3)

source=("${url}/releases/download/build-${_commit}/rpcs3-v${pkgver/_/-}-${_commit::8}_linux64.AppImage")
sha256sums=('e4381175e5f2b63006d7c11fccb0b50b687fb3702cf7a8e3888a752b85e1fca0')

package() {
  chmod +x rpcs3-v${pkgver/_/-}-${_commit::8}_linux64.AppImage
  ./rpcs3-v${pkgver/_/-}-${_commit::8}_linux64.AppImage --appimage-extract 2> /dev/null

  cd AppDir
  install -d "$pkgdir"/usr/{bin,share/{applications,metainfo,pixmaps}}
  mv usr/bin/rpcs3 -t "$pkgdir"/usr/bin
  mv usr/share/applications/rpcs3.desktop -t "$pkgdir"/usr/share/applications
  mv usr/share/icons/hicolor/scalable/apps/rpcs3.svg -t "$pkgdir"/usr/share/pixmaps
  mv usr/share/metainfo/rpcs3.metainfo.xml -t "$pkgdir"/usr/share/metainfo
  rm -rf usr/share/rpcs3/test 
  mv usr/share/rpcs3 -t "$pkgdir"/usr/share
}
