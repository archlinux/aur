java_=11
pkgname="jdk${java_}-graalvm-ee-bin"
pkgver=20.0.0
pkgrel=1
pkgdesc="(Enterprise Edition) Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
options=('staticlibs')
install="$pkgname.install"
# Oracle requires login to download. Downloaded from https://www.oracle.com/tools/graalvm-enterprise-edition.html
source_x86_64=("graalvm-ee-java${java_}-${pkgver}.tar.gz::https://web.archive.org/web/20200228064159/https%3A%2F%2Fdownload.oracle.com%2Fotn%2Futilities_drivers%2Foracle-labs%2Fgraalvm-ee-java11-linux-amd64-20.0.0.tar.gz%3FAuthParam%3D1582872216_1c709e264459fe8f38146174374aa6b8")
sha256sums_x86_64=('b704fd27b5993584a1ad659b41f42ff0ae8893c066b64a6f6a1719fbee382536')

package() {
    cd "graalvm-ee-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
