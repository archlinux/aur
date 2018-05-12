# Maintainer: Cecile Tonglet <cecile.tonglet@gmail.com>
# Contributor: Julian Xhokaxhiu    <info at julianxhokaxhiu dot com>
# Contributor: almostalive   <almostalive2003 at gmail dot com>
# Contributor: Themaister    <maister@archlinux.us>

pkgname=retroarch-rbp-git
pkgver=1.7.3.92.gbe502a39fd
pkgrel=1
pkgdesc="Reference frontend for the libretro API."
arch=('arm' 'armv6h' 'armv7h')
url="http://www.libretro.com"
license=('GPL')
groups=('libretro')
depends=('raspberrypi-firmware' 'libusb')
makedepends=('git')
provides=('retroarch' 'retroarch-git')
optdepends=('libretro-desmume: Nintendo DS core'
            'libretro-gambatte: Nintendo Game Boy/Game Boy Color core'
            'libretro-genesis-plus: Sega Master System/Genesis/Game Gear/CD/32X core'
            'libretro-mgba: Nintendo Game Boy Advance core'
            'libretro-mupen64plus: Nintendo 64 core'
            'libretro-nestopia: Nintendo Entertainment System core'
            'libretro-pcsx-rearmed: Sony PlayStation core'
            'libretro-reicast: Sega Dreamcast core'
            'libretro-snes9x: Super Nintendo Entertainment System core'
            'libretro-yabause: Sega Saturn core'
            'libretro-overlays: Collection of overlays'
            'libretro-shaders: Collection of shaders'
            'retroarch-assets-xmb: XMB menu assets'
            'retroarch-autoconfig-udev: udev joypad autoconfig')
conflicts=('retroarch')
backup=('etc/retroarch.cfg')
_gitname=RetroArch
source=("git+https://github.com/libretro/${_gitname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  local version=$(git describe --tags)
  local version=${version/v/}
  local version=${version//-/.}
  echo $version
}

build() {
  cd "${_gitname}"

  ./configure --prefix=/usr \
    --enable-neon --enable-dispmanx --enable-floathard --enable-udev \
    --disable-ffmpeg --disable-cg --disable-jack --disable-oss --disable-sdl --disable-x11
  make
}

package() {
  cd "${_gitname}"

  make install DESTDIR="${pkgdir}"
}

# vim: ts=2 sw=2 et:
