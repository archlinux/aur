# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

java_=17
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
          "java-environment=${java_}"
          "jdk${java_}-graalvm-bin")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('7dc37bd3703ebebcd6efa39534e6bb6e3ec9c8ee0d97e46d6df5349739c7d2ca')
sha256sums_x86_64=('67b71877727d7771dd1da652a31099c8f12b9050b541e47f11a382997c042edf')
sha256sums_aarch64=('148aeeda8aa2a39fb4b2f0c1bb9768b61d849f5a21e5aff11df84c49988bb0f0')
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
