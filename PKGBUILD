# Maintainer: Chris Charabaruk <chris [at] charabaruk [dot] net>
# Contributor: Andrew Sun <adsun701@gmail.com>
# Contributor: Thomas Ascher <thomas.ascher@gmx.at>

pkgname=systempreferences
_pkgname=SystemPreferences
pkgver=1.2.1
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
source=("https://github.com/gnustep/apps-${pkgname}/releases/download/${pkgname}-${pkgver//./_}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('1c690784d9a86d8eaf8e4724afb38d4cf0e5443ca8c9e70b1242f63d660a44f2')

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
