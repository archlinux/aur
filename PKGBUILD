# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Bernardo Barros <bbarros*AT*xsounds*DOT*org>

pkgname=lv2-ir
_pkgname=ir.lv2
pkgver=1.3.2
pkgrel=3
pkgdesc='Real-time signal convolver especially suited for creating reverb effects'
arch=('i686' 'x86_64')
url='http://factorial.hu/plugins/lv2/ir'
license=('GPL')
depends=('zita-convolver' 'libsamplerate' 'gtk2>=2.16')
provides=('ir-lv2')
conflicts=('ir-lv2')
groups=('lv2-plugins')
makedepends=('lv2')
source=("http://factorial.hu/system/files/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ef9053e7b6002ed9f0b9a95046ec61cfb7035c0b2159f0fdc98ad44403f802ca')

build() {
  cd "${_pkgname}-${pkgver}"
  make
  make convert4chan
}

package() {
  cd "${_pkgname}-${pkgver}"
  make PREFIX="$pkgdir/usr" install
  install -Dm755 convert4chan "$pkgdir/usr/bin/convert4chan"
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
}
