# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=chestnut-git
_pkgname=chestnut
pkgver=0.1.1.r50.gc5b80d4
pkgrel=1
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="An open-source NLE video editor; fork of Olive-Editor"
url="https://github.com/jonno85uk/chestnut"
license=('GPL3')
depends=('ffmpeg' 'qt5-multimedia' 'qt5-svg')
makedepends=('git')
optdepends=('olive-community-effects-git')
provides=('chestnut')
conflicts=('chestnut')
source=("$_pkgname::git+https://github.com/jonno85uk/chestnut.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
