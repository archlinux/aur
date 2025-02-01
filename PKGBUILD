# Maintainer: Viachaslau Khalikin <viachaslavic'at'outlook'dot'com>

pkgname=libretro-gme-git
pkgver=r168.de22a26
pkgrel=1
pkgdesc="libretro port of blargg's Game_Music_Emu library"
arch=('x86_64')
url="https://github.com/libretro/libretro-gme"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=('glibc' 'gcc-libs')
makedepends=('git')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
options=(!debug !lto)
source=("${pkgname%-git}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  sed -i 's/std=c99/std=gnu99/' "${pkgname%-git}"/Makefile
  make -C "${pkgname%-git}"
}

package() {
  install -Dm 644 "${pkgname%-git}"/gme_libretro.so -t "${pkgdir}"/usr/lib/libretro/
  install -Dm 644 "${pkgname%-git}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
