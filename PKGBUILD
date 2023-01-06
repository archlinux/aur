# Maintainer: LordDemecrius83 <lorddemecrius83@proton.me>
# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=kotlin-native-bin
pkgver=1.7.20
pkgrel=1
pkgdesc="An LLVM based backend for the Kotlin compiler and native implementation of the Kotlin standard library"
arch=('x86_64')
url="https://kotlinlang.org/"
license=('Apache')
options=('staticlibs' 'libtool' '!strip')
# 1. For 'java-environment>=8':
# https://kotlinlang.org/docs/native-command-line-compiler.html
# > While the output of the compiler does not have any dependencies or virtual
# > machine requirements, the compiler itself requires
# > [Java 1.8 or higher runtime](https://jdk.java.net/11/).
depends=('java-environment>=8')
optdepends=(
  'lldb: for konan-lldb'
)
provides=('kotlin-native')
conflicts=('kotlin-native' 'kotlin-native-git')
source=(
  "https://github.com/JetBrains/kotlin/releases/download/v${pkgver}/kotlin-native-linux-x86_64-${pkgver}.tar.gz"
)
sha256sums=(
  '65ac0a71fbff016d4387956768a49b668e6cda316e96adb116de5cf1169f5627'
)

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/lib"

  cp -r "kotlin-native-linux-x86_64-${pkgver}" "${pkgdir}/usr/lib/kotlin-native"
  # Fix permissions for some files, e.g. /usr/lib/kotlin-native/klib/common/stdlib/ir/ir_tables/*.knt
  chmod -R +r "${pkgdir}/usr/lib/kotlin-native"

  ln -s /usr/lib/kotlin-native/bin/kotlinc-native "${pkgdir}/usr/bin/kotlinc-native"
  ln -s /usr/lib/kotlin-native/bin/konanc "${pkgdir}/usr/bin/konanc"
  ln -s /usr/lib/kotlin-native/bin/konan-lldb "${pkgdir}/usr/bin/konan-lldb"
  ln -s /usr/lib/kotlin-native/bin/klib "${pkgdir}/usr/bin/klib"
  ln -s /usr/lib/kotlin-native/bin/cinterop "${pkgdir}/usr/bin/cinterop"
  ln -s /usr/lib/kotlin-native/bin/jsinterop "${pkgdir}/usr/bin/jsinterop"
  ln -s /usr/lib/kotlin-native/bin/run_konan "${pkgdir}/usr/bin/run_konan"
  ln -s /usr/lib/kotlin-native/bin/generate-platform "${pkgdir}/usr/bin/generate-platform"
}
