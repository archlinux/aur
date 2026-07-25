# Maintainer: Paolo Mezzano Barahona <pmezzano@gmail.com>
pkgname=jisocreator
pkgver=0.2.2
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
        "$pkgname.svg")
sha256sums=('c1515db386717bf043f933ace56978bc4b5f74573dbea8bf8ebfe63017b8a764'
            '5d2ab72c7d2c422ffadcb2e1f88f932a7943c89628781d653093d1efb4cc7a4e'
            '0879b9acff67b0f9113c8bb4b341678edcab8210e7155108708290c1163c1f20'
            'b29a5cbf04c0bc03b27d3cb7ec8592610a991a4d091a82cbc674cb89d90dcc9a')
validpgpkeys=('C66674F3E744D24235FD945F49E28787ECF14843')

build() {
	cd "$pkgname-$pkgver"
	JAVA_HOME="/usr/lib/jvm/java-21-openjdk" mvn clean package -DskipTests --no-transfer-progress
}

package() {
    install -d "${pkgdir}/opt/jisocreator"
    install -d "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname}-${pkgver}/target/lib" "${pkgdir}/opt/${pkgname}/"
    install -m644 "${srcdir}/${pkgname}-${pkgver}/target/${pkgname}.jar" "${pkgdir}/opt/jisocreator/"
    install -Dm644 "${srcdir}/${pkgname}.svg" "${pkgdir}/usr/share/pixmaps/${pkgname}.svg"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
