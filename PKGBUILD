# Maintainer: Paolo Mezzano Barahona <pmezzano@gmail.com>
pkgname=jisocreator
pkgver=0.1.4
pkgrel=1
pkgdesc="JIsoCreator is a ISO9660 CD Image creator, frontend of MKISOFS, built from sources"
arch=('x86_64')
url="https://github.com/Cavallinux/$pkgname"
license=('GPL-3.0')
depends=('java-runtime>=21' 'gtk3' 'cdrtools')
makedepends=('maven' 'jdk21-openjdk')
provides=('jisocreator')
conflicts=('jisocreator-bin')
source=($pkgname-$pkgver.tar.gz::"https://github.com/Cavallinux/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.sh"
        "$pkgname.png")

sha256sums=('8bb92d1d72947023b3b2e0c6f5794d8348fece5a56010a44b3568a87be81b424'
            '5d2ab72c7d2c422ffadcb2e1f88f932a7943c89628781d653093d1efb4cc7a4e'
            'eedd19de2e0b9eb87791b6b4fd45f94cbd98a36e7fc56b1086a288480a821962'
            'b662235eed256debee97df87331dd91abc359f05016b14ba562a78f1becca2b7')

build() {
	cd "$pkgname-$pkgver"
	JAVA_HOME="/usr/lib/jvm/java-21-openjdk" mvn clean package -Dproject.build.sourceEncoding=UTF-8 -DskipTests --no-transfer-progress
}

package() {
    install -d "${pkgdir}/opt/jisocreator"
    install -d "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname}-${pkgver}/target/lib" "${pkgdir}/opt/${pkgname}/"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/target/${pkgname}.jar" "${pkgdir}/opt/jisocreator/"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
