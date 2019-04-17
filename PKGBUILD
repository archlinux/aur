# Maintainer: Philippe Hürlimann <p@hurlimann.org>
pkgname=kotlin-native
pkgver=1.2.0
pkgrel=1
pkgdesc="A LLVM backend for the Kotlin compiler"
arch=('x86_64')
url="https://github.com/JetBrains/kotlin-native"
license=('Apache')
options=('staticlibs' 'libtool' '!strip')
depends=('java-environment' 'ncurses5-compat-libs')
source=(${pkgname}-${pkgver}::https://github.com/JetBrains/kotlin-native/archive/v${pkgver}.tar.gz)
sha512sums=('165f0aab2b60063cfd331991e5b353a0f47a4bb724929b593216aa4e72eeac1050f77a61c7e3d160502c3ff0c37fd941632d45a3833d7983265bf30deab97b61')

prepare() {
  cd ${pkgname}-${pkgver}
  ./gradlew dependencies:update
}

build() {
  cd ${pkgname}-${pkgver}
  ./gradlew dist
}

package() {
  mkdir -p ${pkgdir}/opt
  mkdir -p ${pkgdir}/usr/bin
  cp -R ${pkgname}-${pkgver}/dist ${pkgdir}/opt/kotlin-native
  chmod 755 ${pkgdir}/opt/kotlin-native
  ln -s /opt/kotlin-native/bin/kotlinc-native ${pkgdir}/usr/bin/kotlinc-native
  ln -s /opt/kotlin-native/bin/konanc ${pkgdir}/usr/bin/konanc
  ln -s /opt/kotlin-native/bin/cinterop ${pkgdir}/usr/bin/cinterop
  ln -s /opt/kotlin-native/bin/run_konan ${pkgdir}/usr/bin/run_konan
}
