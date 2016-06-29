# Maintainer: Tyler Veness <calcmogul at gmail dot com>

pkgname=arm-frc-linux-gnueabi-wpilib-git
pkgver=1461.e8e0527
pkgrel=1
pkgdesc="The WPI FIRST Robotics Competition C/C++ library for the arm-frc-linux-gnueabi toolchain"
arch=(i686 x86_64)
conflicts=('arm-frc-linux-gnueabi-wpilib')
provides=('arm-frc-linux-gnueabi-wpilib')
url="https://usfirst.collab.net/sf/projects/wpilib/"
license=('custom=FRC-BSD')
groups=('frc-2016')
depends=('arm-frc-linux-gnueabi-gcc')
makedepends=('git' 'java-environment=8' 'doxygen')
options=('!strip' 'libtool' 'staticlibs' '!emptydirs')
source=("git+git://github.com/wpilibsuite/allwpilib")
sha512sums=('SKIP')

pkgver() {
  cd allwpilib
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$srcdir/allwpilib"
  ./gradlew wpilibcZip
  ./gradlew doxygenZip
}

package() {
  cd "$srcdir/allwpilib/wpilibc/build"
  mkdir -p $pkgdir/usr/arm-frc-linux-gnueabi/share/doc/wpilib

  yes A | unzip -d $pkgdir/usr/arm-frc-linux-gnueabi wpilibc.zip
  yes A | unzip -d $pkgdir/usr/arm-frc-linux-gnueabi/share/doc/wpilib distributions/wpilibc.zip

  install -Dm644 ../../license.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
