# Maintainer: Gray <apoco@pm.me>
pkgname=dartbuster
pkgver=1.0.2
pkgrel=1
pkgdesc="URL Fuzzing / brute forcing tool, written in dart."
arch=('any')
url="https://github.com/GrayWasTaken/dartbuster"
license=('MIT')
makedepends=('git' 'dart')
changelog=
source=("git+$url")
md5sums=('SKIP') #autofill using updpkgsums
OPTIONS=(!strip !docs !libtool !staticlibs emptydirs zipman purge !debug)

build() {
  cd "$pkgname"
  pub get
  dart2native "bin/dartbuster.dart" -o "bin/dartbuster"
  rm bin/dartbuster.dart
}

package() {
  cd $pkgname
  mkdir -p "$pkgdir/opt/"
  cp -R "${srcdir}"/"${pkgname}" "${pkgdir}"/opt
  sudo ln -sf "/opt/$pkgname/bin/dartbuster" "/bin/dartbuster"
}