# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>
# Contributor: Infernio <infernio at icloud dot com>
# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

pkgbase="lombok"
pkgname=('lombok-common' 'lombok-eclipse-java' 'lombok-eclipse-jee' 'lombok-spring-tools-for-eclipse')
pkgver=1.18.46
pkgrel=1
pkgdesc="Project Lombok integrated with several Eclipse-based installations."
makedepends=('java-runtime')
arch=("any")
url="https://projectlombok.org"
license=('MIT')
source=("https://projectlombok.org/downloads/lombok-${pkgver}.jar"
'lombok-eclipse.install'
'lombok-st4e.install')
sha256sums=('01f7b1a015e33e2b62d5f5f37053306357ab1415fd181fcba7794f5d198c1126'
            'bbf61e76d08d23045c9c78869650e3741b22b7e197032e3c6ffdaa4c6582dd8a'
            '5da2cd360808c724b5d26ac5451a9c9c905c5ac99d35ccd7718bd414a0456e81')
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
    depends=(lombok-common=$pkgver-$pkgrel 'spring-tools-for-eclipse>=5.0.0')
    provides=('lombok-spring-tool-suite')
    conflicts=('lombok-spring-tool-suite')
    install=lombok-st4e.install
}
