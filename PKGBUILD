# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

_java=20
_java_minor=+9.1
pkgname="jdk${_java}-graalvm-ee-bin"
pkgver=20.0.1
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${_java} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom:OTN')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
provides=("java-runtime=${_java}"
          "java-environment=${_java}")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('7dc37bd3703ebebcd6efa39534e6bb6e3ec9c8ee0d97e46d6df5349739c7d2ca')
sha256sums_x86_64=('0aef42ae97bc98acbd11dce81018a7916250fced6ee9f95a934816813e48e4f4')
sha256sums_aarch64=('f1c175018acd6e9976a7374420e44b8c55b5871c2b0452435aba8a136fe8caae')
source_x86_64=("https://download.oracle.com/graalvm/${_java}/latest/graalvm-jdk-${_java}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/${_java}/latest/graalvm-jdk-${_java}_linux-aarch64_bin.tar.gz")

package() {
    cd "graalvm-jdk-${pkgver}${_java_minor}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${_java}-graalvm-ee/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${_java}/g" < "../graalvm-ee-rebuild-libpolyglot.hook" > "graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-ee-jdk${_java}-rebuild-libpolyglot.hook"
}
