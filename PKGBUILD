# Submitter: Norbert Raschka
# Maintainer: Roland Suchan <snrd at arcor dot de>

pkgname=ffdiaporama
pkgver=3.0
pkgrel=1
pkgdesc='ffDiaporama is an application for creating video sequences'
_pkgname="ffDiaporama"
arch=(x86_64)
url=http://ffdiaporama.tuxfamily.org
license=(GPL2)
depends=('qt6-base' 'qt6-tools' 'qt6-svg' 'sqlite' 'exiv2' 'taglib')
provides=(

)
makedepends=(
  gcc
)
source=('git+https://github.com/nojorada/ffDiaporama.git')
md5sums=('SKIP')


prepare() {
  cd ffDiaporama
}

build() {
  cd ffDiaporama
  #sed -i 's@GTK;GNOME;Qt;KDE;AudioVideo;@AudioVideo;Player;X-Red-Hat-Base;@g' ffDiaporama.desktop
  qmake6 'CONFIG+=qtquickcompiler' 'INCLUDEPATH += /opt/include' 'LIBPATH += /opt/lib' ffDiaporama.pro /PREFIX=/usr

  make "-j$(nproc)" || return 1
}

package() {
  #cd ffDiaporama
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
