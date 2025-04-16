graal_=24.0.1+9.1
java_=24
pkgname="jdk${java_}-graalvm-ce-bin"
pkgver=24.0.1
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
replaces=("native-image-jdk${java_}-bin")
options=('staticlibs' !debug)
install="$pkgname.install"
source=('graalvm-rebuild-libpolyglot.hook')
sha256sums=('SKIP')
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${pkgver}/graalvm-community-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${pkgver}/graalvm-community-jdk-${pkgver}_linux-aarch64_bin.tar.gz")
sha256sums_x86_64=('d2c544de672e400476a09c8f1da79ecc6b774a9441e234948542c3b3e6a84bde')
sha256sums_aarch64=('a3d1be8fadfb0d3df632252301f79a9b02b47e523da66539d370c62e683d762e')

package() {
    cd "graalvm-community-openjdk-${graal_}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-rebuild-libpolyglot.hook" > "graalvm-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-jdk${java_}-rebuild-libpolyglot.hook"
}
