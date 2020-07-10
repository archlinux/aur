# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname=qtc-markview
pkgname=qtcreator-markview-plugin
pkgver=4.12.0
pkgrel=1
pkgdesc="Qt Creator markup plugin"
groups=('qt' 'qt5')
arch=('x86_64')
url='https://github.com/OneMoreGres/qtc-markview'
license=('MIT')
depends=('qtcreator')
makedepends=('qtcreator-src')
provides=('qtcreator-markview-plugin')
conflicts=('qtcreator-markview-plugin-git')
source=("${pkgname}-${pkgver}::https://github.com/OneMoreGres/qtc-markview/archive/4.12.0.zip")
sha512sums=('84381831918727ef103ccc188ead65d482da3cd9c774fe94639e6cb42fda38bd90aaf13491b797500fafb4d16369fdf8eb5acf899261b38cd687cfa69e5ac20f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # TODO: QTC_BUILD=/usr
  QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build/usr KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib \
    KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
    qmake LIBS+="-L/usr/lib/qtcreator -L/usr/lib/qtcreator/plugins"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cp -r build/* "${pkgdir}"
}
