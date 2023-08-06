# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgname=gnoga
pkgver=1.6a
pkgrel=1
pkgdesc="Ada native GUI framework similar to the Electron framework"
arch=('x86_64')
url="http://www.gnoga.com/"
license=('GPL3')
depends=('libgpr')
makedepends=(gcc-ada gprbuild gprtools libgpr)
provides=('gnoga')
source=(https://downloads.sourceforge.net/project/gnoga/gnoga-${pkgver}.zip
        fix-object-subtype-not-statically-matching-designated-subtype.patch)
sha256sums=('5eca4c8de6b59c6b6c51a22310b1e4175afe62c893604955e9014c4ed8e79148'
            '3365d77edb6cee4c915d437905af1bb8ab4304c8db69ad089c7cadb30662ce34')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}"/fix-*

  make -j1 BUILD_MODE=Release all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX="${pkgdir}"/usr -j1 BUILD_MODE=Release install
  cp "${srcdir}/${pkgname}-${pkgver}"/settings.gpr "${pkgdir}"/usr/share/gpr/settings.gpr
}
