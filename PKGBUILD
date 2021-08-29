# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=11
pkgname="jdk${java_}-graalvm-ee-bin"
pkgver=21.2.0.1
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
optdepends=("graal-nodejs-jdk${java_}-bin: Node.js component (used to be bundled with this package before the 21.1.0 release)")
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-rebuild-libpolyglot.hook')
sha256sums=('SKIP')
# Oracle requires login to download. Downloaded from https://www.oracle.com/tools/graalvm-enterprise-edition.html
source_x86_64=("https://web.archive.org/web/20210829041745if_/https://download.oracle.com/otn/utilities_drivers/oracle-labs/graalvm-ee-java11-linux-amd64-21.2.0.1.tar.gz?AuthParam=1630210751_ee6afcb9eadd190c7710ceb4a92e5f59")
source_aarch64=("https://web.archive.org/web/20210829042334if_/https://download.oracle.com/otn/utilities_drivers/oracle-labs/graalvm-ee-java11-linux-aarch64-21.2.0.1.tar.gz?AuthParam=1630211125_e853928e0878bc3a4573f291ce0ab5ec")
sha256sums_x86_64=('6ae0571a23e69405b369444d469fedc4ed98a52a50089b158492d23467696fcf')
sha256sums_aarch64=('c9ab81a2027e3754770497f6a7d593a25928b8723038bc4b31b74e0dae24e6ec')

package() {
    cd "graalvm-ee-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-rebuild-libpolyglot.hook" > "graalvm-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-jdk${java_}-rebuild-libpolyglot.hook"
}
