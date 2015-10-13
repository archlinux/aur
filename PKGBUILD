# Maintainer: William Luc Ritchie <luc dot ritchie at gmail dot com>
# Contributor: Borja Ruiz <borja [at] libcrack [dot] so>

_pkgname=apkstudio
pkgname=$_pkgname-git
pkgver=3.0.0.b4.r0.g8a6fefd
pkgrel=1
pkgdesc='An IDE for decompiling/editing & then recompiling of android application binaries.'
arch=('i686' 'x86_64')
url='http://github.vaibhavpandey.com/apkstudio/'
license=('GPL2')
depends=('qt5-base')
makedepends=('git' 'qt5-tools')
source=('git+https://github.com/vaibhavpandeyvpz/apkstudio.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  lrelease-qt5 res/lang/en.ts
  mkdir build
  cd build
  qmake-qt5 -r ../apkstudio.pro CONFIG+=release
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/usr/share/apkstudio/vendor"
  unzip "external/vendor.zip" -d "$pkgdir/usr/share/apkstudio/vendor"
}
