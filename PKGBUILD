# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=ossia-score
pkgname=$_pkgname-bin
pkgver=3.1.11
pkgrel=2
pkgdesc="An interactive sequencer for the intermedia arts (binary release)"
arch=('x86_64')
url="https://github.com/ossia/score"
license=('GPL3')
depends=('faust' 'ffmpeg' 'jack' 'libxcb' 'portaudio' 'qt6-declarative' 'qt6-imageformats'
         'qt6-scxml' 'qt6-serialport' 'qt6-shadertools' 'qt6-svg' 'qt6-websockets')
optdepends=('leap-motion-driver' 'leap-motion-sdk' 'libfreenect2' 'lilv' 'lv2' 'pipewire' 'sdl2' 'suil' 'ysfx')
makedepends=('fuse2')
provides=($_pkgname)
conflicts=($_pkgname)
_appimage="ossia.score-$pkgver-linux-amd64.AppImage"
source=("$url/releases/download/v3.1.11/$_appimage")
sha256sums=('7af0e59b680761312df15d05fd456040309806621007f9eda0a76940d2cefee7')

prepare() {
  chmod +x "$_appimage"
  ./"$_appimage" --appimage-extract
}

package() {
  cd squashfs-root
  install -Dm644 usr/share/pixmaps/$_pkgname.png -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 usr/share/applications/$_pkgname.desktop -t "$pkgdir/usr/share/applications"
  cd usr/bin
  install -Dm755 $_pkgname $_pkgname-vst3puppet $_pkgname-vstpuppet -t "$pkgdir/usr/bin"
}
