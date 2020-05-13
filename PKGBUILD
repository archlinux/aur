# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Philippe Hürlimann <p@hurlimann.org>
pkgname=kotlin-native
_pkgname=kotlin-native-build
pkgver=1.4.0dev8404
_pkgver=1.4.0-dev-8404
pkgrel=1
pkgdesc="A LLVM backend for the Kotlin compiler"
arch=('x86_64')
url="https://github.com/JetBrains/kotlin-native"
license=('Apache')
options=('staticlibs' 'libtool' '!strip')
depends=('java-environment' 'ncurses5-compat-libs')
source=(https://github.com/JetBrains/kotlin-native/archive/build-${_pkgver}.tar.gz)
sha512sums=('88eca274f6800029453505ce185bf5068cca69536c6de7b51a8219934b3be76fbfb1f44e812dc78a4c58958d33b47fceb0fac1f3abf17f856d444868d723f33d')

prepare() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  ./gradlew dependencies:update
}

build() {
  cd ${srcdir}/${_pkgname}-${_pkgver}
  ./gradlew dist
}

package() {
  mkdir -p ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/bin
  cp -R ${_pkgname}-${_pkgver}/dist ${pkgdir}/opt/kotlin-native
  chmod 755 ${pkgdir}/opt/kotlin-native
  ln -s /opt/kotlin-native/bin/kotlinc-native ${pkgdir}/usr/bin/kotlinc-native
  ln -s /opt/kotlin-native/bin/konanc ${pkgdir}/usr/bin/konanc
  ln -s /opt/kotlin-native/bin/cinterop ${pkgdir}/usr/bin/cinterop
  ln -s /opt/kotlin-native/bin/run_konan ${pkgdir}/usr/bin/run_konan
}
