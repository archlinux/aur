# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Bernardo Barros <bbarros*AT*xsounds*DOT*org>

pkgname=ir-lv2
pkgver=1.3.2
pkgrel=1
pkgdesc='LV2 Impulse response (convolution) plugin (for reverb and cabinet simulation)'
arch=('i686' 'x86_64')
url='https://github.com/Anchakor/ir.lv2'
license=('GPL')
depends=('zita-convolver' 'libsamplerate' 'gtk2>=2.16')
provides=('ir-lv2')
conflicts=('ir-lv2-git' 'lv2-ir' 'lv2-ir-git' 'ir.lv2')
groups=('lv2-plugins')
makedepends=('lv2' 'git')
source=("$pkgname::git+https://github.com/Anchakor/ir.lv2#commit=af1f8ab")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  make
  make convert4chan
}

package() {
  cd "${pkgname}"
  make PREFIX="$pkgdir/usr" install
  install -Dm755 convert4chan "$pkgdir/usr/bin/convert4chan"
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
}
