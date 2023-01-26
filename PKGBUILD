# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=17
pkgname="jdk${java_}-graalvm-bin"
pkgver=22.3.1
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
optdepends=("graaljs-jdk${java_}-bin: JavaScript component (used to be bundled with this package before the 22.2.0 release)"
            "graal-llvm-jdk${java_}-bin: LLVM component (used to be bundled with this package before the 22.2.0 release)"
            "graal-visualvm-jdk${java_}-bin: VisualVM component (used to be bundled with this package before the 22.2.0 release)")
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-rebuild-libpolyglot.hook')
sha256sums=('SKIP')
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/graalvm-ce-java${java_}-linux-amd64-${pkgver}.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/graalvm-ce-java${java_}-linux-aarch64-${pkgver}.tar.gz")
sha256sums_x86_64=('3acf4a59ae38cb0cd331a81777f6d24f8fdc6179ac25e5b198b6e08c444c9129')
sha256sums_aarch64=('a954fe8a4962be6ac8d0efff9ebf15108df59fad299213a31d2451bc78434818')

package() {
    cd "graalvm-ce-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-rebuild-libpolyglot.hook" > "graalvm-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-jdk${java_}-rebuild-libpolyglot.hook"
}
