# Maintainer: Godeps <Godeps@protonmail.com>
# Based on nns's jdk17-graalvm-ee-bin AUR package

java_=19
pkgname="jdk${java_}-graalvm-ee-bin"
pkgver=22.3.1
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom:OTN')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('7dc37bd3703ebebcd6efa39534e6bb6e3ec9c8ee0d97e46d6df5349739c7d2ca')
# JDK19 is still marked as experimental and thefore not available on the open oracle mirrors so we use the internet archive for now.
sha256sums_x86_64=('9ac9c4e0d94772527950efb0d3b2630d5161e9b5659289e02cda8246530024c8')
sha256sums_aarch64=('59ec396dd68143efc0d3199711aea1e50883e269473cbaaaea32b66090433007')
source_x86_64=("https://web.archive.org/web/20230210121435/https://download.oracle.com/otn/utilities_drivers/oracle-labs/graalvm-ee-java19-linux-amd64-22.3.1.tar.gz?AuthParam=1676031374_e770a327c875d6085c0328e472f6b2ad")
source_aarch64=("https://web.archive.org/web/20230210122242/https://download.oracle.com/otn/utilities_drivers/oracle-labs/graalvm-ee-java19-linux-aarch64-22.3.1.tar.gz?AuthParam=1676031867_cb5783ae7e43a80ed98ea8d7646b2761")

package() {
    cd "graalvm-ee-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-ee-rebuild-libpolyglot.hook" > "graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook"
}
