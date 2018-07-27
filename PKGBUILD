# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=mp4fixer-git
_pkgname=mp4fixer
pkgver=r3.33d6351
pkgrel=1
pkgdesc="Tool to recover damaged/unfinished mp4 files with h264 video"
url="https://github.com/bookkojot/mp4fixer"
depends=('perl' 'faad2')
makedepends=('git')
conflicts=(mp4fixer)
license=('GPL-3')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/bookkojot/mp4fixer.git')
md5sums=('SKIP')

build() {
  cd ${srcdir}/${pkgname}
  gcc aac.c -L. -lfaad -lm -o aacfixer
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  install -Dm755 aacfixer "${pkgdir}/usr/bin/aacfixer"
  install -Dm755 montage.pl "${pkgdir}/usr/bin/montage.pl"
  install -Dm755 fixer.pl "${pkgdir}/usr/bin/fixer.pl"
}

# vim:set ts=2 sw=2 et:
