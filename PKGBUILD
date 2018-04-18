# Maintainer: William Luc Ritchie <luc dot ritchie at gmail dot com>
# Contributor: Borja Ruiz <borja [at] libcrack [dot] so>

_pkgname=apkstudio
pkgname=$_pkgname-git
pkgver=r211.5b6f115
pkgrel=1
epoch=1
pkgdesc='An IDE for decompiling/editing & then recompiling of android application binaries.'
arch=('i686' 'x86_64')
url='http://www.vaibhavpandey.com/apkstudio/'
license=('GPL2')
depends=('qt5-base' 'android-tools')
makedepends=('git' 'qt5-tools' 'unzip')
source=('git+https://github.com/vaibhavpandeyvpz/apkstudio.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  lrelease-qt5 res/lang/en.ts
  qmake-qt5 -r apkstudio.pro CONFIG+=release
  make
}

package() {
  cd "$srcdir"
  install -Dm755 "$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
