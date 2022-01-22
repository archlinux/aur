# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Max Bruckner <max at maxbruckner dot de>

pkgname=smooth
pkgver=0.9.9
pkgrel=1
pkgdesc="An object oriented C++ class library for Windows, OS X, Linux and most Unix-like operating systems"
arch=('i686' 'x86_64')
url="http://www.smooth-project.org/"
license=('Artistic2.0')
depends=('curl' 'fribidi' 'gtk3' 'libjpeg-turbo' 'libxml2')
provides=('libsmooth-0.9.so')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/enzo1982/smooth/archive/v${pkgver}.tar.gz")
sha512sums=('53d769663c30ac00512c4c13bdee10411ea1918fec76a9c1bea24af4d4aa399bbf1309e94708d9dbfe00688d9ada281bd10084f2e841dbc191df3ceda4e05e54')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/_/-}"
  make DESTDIR="${pkgdir}" install
  ln -s "/usr/lib/libsmooth-${pkgver%.*}.so" "${pkgdir}/usr/lib/libsmooth.so"
}
