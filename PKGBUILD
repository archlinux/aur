# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname=qtc-markview
pkgname=qtcreator-markview-plugin-git
pkgver=r77.4833637
pkgrel=2
pkgdesc="Qt Creator markup plugin (latest development version)"
groups=('qt' 'qt5')
arch=('x86_64')
url='https://github.com/OneMoreGres/qtc-markview'
license=('MIT')
depends=('qtcreator')
makedepends=('git' 'qtcreator-src')
provides=('qtcreator-markview-plugin')
conflicts=('qtcreator-markview-plugin')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  # TODO: QTC_BUILD=/usr
  QTC_SOURCE=/usr/src/qtcreator QTC_BUILD=build/usr KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib \
    KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
    qmake LIBS+="-L/usr/lib/qtcreator -L/usr/lib/qtcreator/plugins"
  make
}

package() {
  cd $pkgname
  cp -r build/* ${pkgdir}
}
