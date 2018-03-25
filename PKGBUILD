# Maintainer: David Runge <dave@sleepmap.de>
_name=fltk
pkgname=ntk
pkgver=1.3.1000
pkgrel=1
pkgdesc="Fork of FLTK 1.3.0 with additional functionality."
arch=('x86_64')
url="https://non.tuxfamily.org/wiki/NTK"
license=('custom')
groups=('non')
depends=('libxft' 'cairo' 'libjpeg')
makedepends=('python')
provides=('ntk')
conflicts=('ntk-git')
source=("$pkgname-$pkgver.tar.gz::https://git.tuxfamily.org/non/${_name}.git/snapshot/${_name}-${pkgver}.tar.gz")
sha512sums=('cde58a3e08687e9426549125da7cea80b217549fe44c620479af6c78a2b169501d4c857a4ae8ff8b0fcdc7604a25ae81a7c7da786260dab26bb19bf037ad0f27')

prepare() {
  mv -v "${_name}-${pkgver}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  ./waf configure --prefix=/usr
  ./waf
}

package() {
  cd "${pkgname}-${pkgver}"
  ./waf --destdir="$pkgdir/" install
  # license
  install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # docs
  install -vDm 644 {CREDITS,README} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
