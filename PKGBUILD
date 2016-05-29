# Maintainer: revel <revelΘmuub·net>
# Contributor: Alexej Magura <agm2819*gmail*>
# Contributor: tmm1 <archΘtmm1·net>

pkgname=duma
pkgver=2.5.15
pkgrel=3
pkgdesc='Multi-platform memory debugging library (Detect Unintended Memory Access)'
arch=('i686' 'x86_64')
url='http://duma.sourceforge.net/'
license=('GPL')
depends=('bash' 'gcc-libs')
_pkgver="${pkgver//./_}"
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/${pkgname}_${_pkgver}.tar.gz")
md5sums=('fe630c69cbaa39caf225a3d9ed2fda1f')
sha256sums=('baaf794854e3093ad1bddadbfb8ad4b220a7117d70359ee216bd59e353734e17')

prepare() {
  cd "${pkgname}_${_pkgver}"
  sed -i 's/CPPFLAGS=/\0-std=gnu++98 /g' GNUmakefile
}

build() {
  cd "${pkgname}_${_pkgver}"
  make
}

package() {
  cd "${pkgname}_${_pkgver}"
  make prefix="$pkgdir/usr/" install
  install -m644 duma_hlp.h "$pkgdir/usr/include/"
}
