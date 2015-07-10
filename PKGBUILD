# Maintainer: William Luc Ritchie <luc dot ritchie at gmail dot com>
# Contributor: Borja Ruiz <borja [at] libcrack [dot] so>

_pkgname=apkstudio
pkgname=$_pkgname-git
pkgver=r2.b1e443a
pkgrel=1
pkgdesc='An IDE for decompiling/editing & then recompiling of android application binaries.'
arch=('i686' 'x86_64')
url='http://apkstudio.codeplex.com/'
license=('GPL2')
depends=('qt5-base')
makedepends=('git')
source=('git+https://git01.codeplex.com/apkstudio.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir build
  cd build
  qmake-qt5 -r ../apkstudio.pro
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
