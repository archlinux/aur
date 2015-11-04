# Maintainer: William Luc Ritchie <luc dot ritchie at gmail dot com>
# Contributor: Borja Ruiz <borja [at] libcrack [dot] so>

_pkgname=apkstudio
pkgname=$_pkgname-git
pkgver=3.0.0.b2.r33.gbab0183
pkgrel=1
pkgdesc='An IDE for decompiling/editing & then recompiling of android application binaries.'
arch=('i686' 'x86_64')
url='http://github.vaibhavpandey.com/apkstudio/'
license=('GPL2')
depends=('qt5-base')
makedepends=('git' 'qt5-tools' 'unzip')
source=('git+https://github.com/vaibhavpandeyvpz/apkstudio.git'
'https://bintray.com/artifact/download/vaibhavpandeyvpz/generic/2015.10.29/vendor.zip')
sha256sums=('SKIP'
            'b089427ee80aff65e87cb19ca2f08cd74d156a1b692da86a1ba37aa39689f539')
noextract=('vendor.zip')

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
  cd "$srcdir"
  install -Dm755 "$_pkgname/build/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -dm755 "$pkgdir/usr/share/apkstudio/vendor"
  unzip "vendor.zip" -d "$pkgdir/usr/share/apkstudio/vendor"
}
