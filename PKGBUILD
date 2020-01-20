# Maintainer: Severin Kaderli <severin@kaderli.dev>
_pkgname=tale
pkgname=${_pkgname}-git
pkgver=1.0.0.r18.g53d701b
pkgrel=1
pkgdesc="An experimental version control system."
arch=('x86_64')
url="https://gitlab.com/severinkaderli/tale"
license=('MIT')
depends=('zlib')
makedepends=('maven' 'git' 'jdk8-graalvm-bin')
conflicts=('tale')
source=('git+https://gitlab.com/severinkaderli/tale')
md5sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    JAVA_HOME="/usr/lib/jvm/java-8-graalvm/" mvn -Dmaven.test.skip=true package
}

package() {
    cd "${srcdir}/${_pkgname}"

    install -Dm755 "target/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"   

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
