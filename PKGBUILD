# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=11
pkgname="jdk${java_}-graalvm-bin"
pkgver=20.1.0
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
options=('staticlibs')
install="$pkgname.install"
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/graalvm-ce-java${java_}-linux-amd64-${pkgver}.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/graalvm-ce-java${java_}-linux-aarch64-${pkgver}.tar.gz")
sha256sums_x86_64=('18f2dc19652c66ccd5bd54198e282db645ea894d67357bf5e4121a9392fc9394')
sha256sums_aarch64=('c548c89618841904187f8bbb8ceea531d7e0c0c2beddacb1c337121699208d72')

package() {
    cd "graalvm-ce-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
