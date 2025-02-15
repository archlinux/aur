# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>

pkgname=ffglitch-git
_pkgname=ffglitch
pkgrel=1
pkgver=n7.0.r266.gc769c36
pkgdesc="FFmpeg fork for glitching"
arch=("x86_64")
url="https://ffglitch.org"
license=("GPL-3.0-only")
depends=('alsa-lib' 'libdrm' 'libxcb' 'zlib' 'libxau' 'libxdmcp' 'sdl2')
conflicts=('ffglitch')
provides=("ffglitch=${pkgver}")
makedepends=('nasm')
source=('ffglitch::git+https://github.com/ramiropolla/ffglitch-core.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  ./configure --disable-doc --enable-gpl --enable-static --disable-shared --disable-autodetect --disable-iconv --enable-zlib --enable-libxvid --enable-rtmidi --enable-libzmq --enable-sdl2 --enable-libxcb --enable-libdrm
  make
  make ffjs
}

package() {
  cd "$_pkgname"
  install -Dm755 ffedit -t ${pkgdir}/usr/bin/
  install -Dm755 ffgac -t ${pkgdir}/usr/bin/
  install -Dm755 fflive -t ${pkgdir}/usr/bin/
  install -Dm755 ffjs -t ${pkgdir}/usr/bin/
}
