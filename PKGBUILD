# Maintainer: Godeps <Godeps@protonmail.com>
# Based on nns's jdk17-graalvm-ee-bin AUR package

java_=11
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
sha256sums_x86_64=('cf529eb5c65d17c79db7fe0a8f892f9b17501bdf219ea99c6e0eb5b4088ee028')
sha256sums_aarch64=('847d535f11e8d0b56cb87bd61132bfc65d4ac3eb502d4da415a79aa5cb83d517')
source_x86_64=("https://oca.opensource.oracle.com/gds/GRAALVM_EE_JAVA${java_}_${pkgver//./_}/graalvm-ee-java${java_}-linux-amd64-${pkgver}.tar.gz")
source_aarch64=("https://oca.opensource.oracle.com/gds/GRAALVM_EE_JAVA${java_}_${pkgver//./_}/graalvm-ee-java${java_}-linux-aarch64-${pkgver}.tar.gz")

package() {
    cd "graalvm-ee-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-ee-rebuild-libpolyglot.hook" > "graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook"
}
