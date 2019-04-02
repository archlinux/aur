# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=olive-git
_pkgname=olive
pkgver=continuous.r0.ga0f6299
_commit=a0f6299
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Free non-linear video editor"
url="https://www.olivevideoeditor.org/"
license=('GPL3')
depends=('ffmpeg' 'frei0r-plugins' 'qt5-multimedia' 'qt5-svg')
makedepends=('git')
optdepends=('olive-community-effects-git')
conflicts=('olive')
source=("git+https://github.com/olive-editor/olive#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  qmake CONFIG+=release PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
