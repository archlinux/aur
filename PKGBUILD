# Maintainer: solareon <aur at solareon dot com>
# Contributor: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: <asamk(at)gmx.de>

pkgver=24.0.2
java_=${pkgver%%.*}
graal_=${pkgver}+11.1
pkgname="jdk${java_}-graalvm-bin"
pkgrel=3
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
sha256sums_x86_64=('6d62846c826ddb9307deec71e7661c26fa5a5e3985d7bb9005ea42163a390720')
sha256sums_aarch64=('c54d951a858791483d58270ecbc0946f28c4742c7fac74a4ebb2764bbf66d6f5')
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
