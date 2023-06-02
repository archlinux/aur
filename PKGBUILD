# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Infernio <infernio at icloud dot com>
# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgbase="lombok"
pkgname=('lombok-common' 'lombok-eclipse-java' 'lombok-eclipse-jee' 'lombok-spring-tool-suite')
pkgver=1.18.28
pkgrel=1
pkgdesc="Project Lombok integrated with several Eclipse-based installations"
makedepends=('java-runtime')
arch=("any")
url="https://projectlombok.org"
license=('MIT')
source=("https://projectlombok.org/downloads/lombok-${pkgver}.jar")
sha256sums=('b774dc4fca543225d8b5e8c1637eb413c4363b2e613e95222776f792a8cec0e0')
noextract=("lombok.jar")

build() {
    java -jar lombok-$pkgver.jar publicApi
}

package_lombok-common() {
    replaces=('lombok-eclipse')
    conflicts=('lombok-eclipse')
    install -Dm644 lombok-$pkgver.jar "${pkgdir}"/usr/lib/$pkgname/lombok.jar
    install -Dm644 lombok-api.jar "${pkgdir}"/usr/lib/$pkgname/lombok-api.jar
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_lombok-eclipse-java() {
    pkgdesc="Lombok integration with Eclipse IDE for Java Developers"
    depends=(lombok-common=$pkgver-$pkgrel 'eclipse-java')
    install=lombok-eclipse.install
}

package_lombok-eclipse-jee() {
    pkgdesc="Lombok integration with Eclipse IDE for Java EE Developers"
    depends=(lombok-common=$pkgver-$pkgrel 'eclipse-jee')
    install=lombok-eclipse.install
}

package_lombok-spring-tool-suite() {
    pkgdesc="Lombok integration with Spring Tool Suite (STS)"
    depends=(lombok-common=$pkgver-$pkgrel 'spring-tool-suite')
    install=lombok-sts.install
}
