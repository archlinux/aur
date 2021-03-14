# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname=qtc-markview
pkgname=qtcreator-markview-plugin
pkgver=4.14.0
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
sha512sums=('b550535ebe216c459ddbb80026a4d6556be477e4da4486230a557345c77b817dde5b3d02756b8a543914e95c27e749b29b956f2b225c2e84b6b1a6cfe2d10464')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build/usr KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib \
    KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
    qmake-qt5 LIBS+="-L/usr/lib/qtcreator -L/usr/lib/qtcreator/plugins"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cp -r build/* "${pkgdir}"
}
