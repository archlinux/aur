# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=systempreferences
_pkgname=SystemPreferences
pkgver=1.2.0
pkgrel=1
pkgdesc="An application which allows to manage the settings of many aspects of the gnustep environment and its applications."
arch=('i686' 'x86_64')
url="http://www.gnustep.org/experience/systempreferences.html"
license=('GPL2')
install="${pkgname}.install"
depends=('gnustep-base'
         'gnustep-gui'
         'gnustep-back')
makedepends=('gcc-objc'
             'gnustep-make')
source=("ftp://ftp.gnustep.org/pub/gnustep/usr-apps/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('690cfd28552c5883fe06a89283f44574f41d937627b41c8435743f07e360e7b9')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgdir}/usr/lib/GNUstep/Applications/${_pkgname}.app/Resources/${_pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
