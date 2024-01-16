# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: <asamk(at)gmx.de>

pkgver=21.0.2
graal_=${pkgver}+13.1
java_=${pkgver%%.*}
pkgname="jdk${java_}-graalvm-bin"
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
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-rebuild-libpolyglot.hook')
sha256sums=('eae72b5a2a2826eed7e4be5710d33f82934622a390ab6a9f009ed7753359e02e')
sha256sums_x86_64=('b048069aaa3a99b84f5b957b162cc181a32a4330cbc35402766363c5be76ae48')
sha256sums_aarch64=('a34be691ce68f0acf4655c7c6c63a9a49ed276a11859d7224fd94fc2f657cd7a')
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${pkgver}/graalvm-community-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${pkgver}/graalvm-community-jdk-${pkgver}_linux-aarch64_bin.tar.gz")

package() {
    cd "graalvm-community-openjdk-${graal_}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE_NATIVEIMAGE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-rebuild-libpolyglot.hook" > "graalvm-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-jdk${java_}-rebuild-libpolyglot.hook"
}
