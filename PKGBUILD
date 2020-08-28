# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname=qtc-markview
pkgname=qtcreator-markview-plugin
pkgver=4.13.0
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
source=("${pkgname}-${pkgver}::https://github.com/OneMoreGres/qtc-markview/archive/${pkgver}.zip")
sha512sums=('9a9917d7fd90827656431265e22ba507a1344accc9c6f5fa2f77f60baf72609210f428183f4451bcfe2a8845d96f5eb147fb91cde2895e81f281c22656431757')

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
