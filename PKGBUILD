# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=chestnut-git
_pkgname=chestnut
pkgver=0.2.0.r7.gcf9dcfe2
pkgrel=2
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="An open-source NLE video editor"
url="https://github.com/jonno85uk/chestnut"
license=('GPL3')
depends=('ffmpeg' 'fmt' 'mediahandling-git' 'qt5-multimedia' 'qt5-svg')
makedepends=('git')
optdepends=('olive-community-effects-git')
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
