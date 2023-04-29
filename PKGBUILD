# Maintainer: Godeps <godeps@protonmail.com>
# Based on lucaswerkmeister's jdk8-graalvm-bin package

java_=8
pkgname="jdk${java_}-graalvm-ee-bin"
pkgver=21.3.6
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64')
url='https://www.graalvm.org/'
license=('custom:OTN')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
optdepends=("graal-nodejs-jdk${java_}-bin: Node.js component (used to be bundled with this package before the 21.1.0 release)")
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
install="$pkgname.install"
source=("https://oca.opensource.oracle.com/gds/GRAALVM_EE_JAVA${java_}_${pkgver//./_}/graalvm-ee-java${java_}-linux-amd64-${pkgver}.tar.gz"
        'graalvm-ee-rebuild-libpolyglot.hook')
sha256sums=('a234901fd32847fa2f7ed296117a25d59e1a396d10bea72424438f06835c49c2'
            'SKIP')

package() {
    cd "graalvm-ee-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm-ee/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-ee-rebuild-libpolyglot.hook" > "graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-ee-jdk${java_}-rebuild-libpolyglot.hook"
}
