# Maintainer: Severin Kaderli <severin@kaderli.dev>
_pkgname=tale
pkgname=${_pkgname}-git
pkgver=0.0.1.r0.g67b0dcb
pkgrel=1
pkgdesc="An experimental version control system."
arch=('i686' 'x86_64')
url="https://gitlab.com/severinkaderli/tale"
license=('MIT')
makedepends=('maven' 'git' 'graal-native-image-bin')
conflicts=('tale')
source=('git+https://gitlab.com/severinkaderli/tale')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    export GRAALVM_HOME="/usr/lib/jvm/java-8-graal/"
    export JAVA_HOME="${GRAALVM_HOME}"
    mvn -Dmaven.test.skip=true package
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "target/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"   
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
