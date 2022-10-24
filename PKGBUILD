# Maintainer: Tom Locke <xx+aur@nns.ee>

java_=17
pkgname="jdk${java_}-graalvm-ee-bin"
pkgver=22.3.0
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
sha256sums=('SKIP')
source_x86_64=("https://oca.opensource.oracle.com/gds/GRAALVM_EE_JAVA${java_}_${pkgver//./_}/graalvm-ee-java${java_}-linux-amd64-${pkgver}.tar.gz")
source_aarch64=("https://oca.opensource.oracle.com/gds/GRAALVM_EE_JAVA${java_}_${pkgver//./_}/graalvm-ee-java${java_}-linux-aarch64-${pkgver}.tar.gz")
sha256sums_x86_64=('db307667720c5744ac4d2fe668b247da205d7d2d8c341f40e5e4864f7a6dec83')
sha256sums_aarch64=('57207d6372aacfeedd0aa4bdd7eeb7f36fa0abc7e144c44c8746e8e5aef859af')

package() {
    cd "graalvm-ee-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-ee-rebuild-libpolyglot.hook" > "graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook"
}
