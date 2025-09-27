# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Infernio <infernio at icloud dot com>
# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgbase="lombok"
pkgname=('lombok-common' 'lombok-eclipse-java' 'lombok-eclipse-jee' 'lombok-spring-tools-for-eclipse')
pkgver=1.18.42
pkgrel=1
pkgdesc="Project Lombok integrated with several Eclipse-based installations."
makedepends=('java-runtime')
arch=("any")
url="https://projectlombok.org"
license=('MIT')
source=("https://projectlombok.org/downloads/lombok-${pkgver}.jar")
sha256sums=('3488a4e9994c26596baaceebee58cad36a50e3bdaec5be72b5834d3c3b560306')
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
    pkgdesc="Lombok integration with Eclipse IDE for Java Developers."
    depends=(lombok-common=$pkgver-$pkgrel 'eclipse-java-bin')
    install=lombok-eclipse.install
}

package_lombok-eclipse-jee() {
    pkgdesc="Lombok integration with Eclipse IDE for Java EE Developers."
    depends=(lombok-common=$pkgver-$pkgrel 'eclipse-jee-bin')
    install=lombok-eclipse.install
}

package_lombok-spring-tools-for-eclipse() {
    pkgdesc="Lombok integration with Spring Tools (aka Spring Tool Suite)."
    depends=(lombok-common=$pkgver-$pkgrel 'spring-tools-for-eclipse')
    provides=('lombok-spring-tool-suite')
    conflicts=('lombok-spring-tool-suite')
    install=lombok-sts.install
}
