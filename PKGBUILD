#Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
#Contributor: Andrew Bueide <abueide@protonmail.com>
pkgname="gdx-texture-packer-gui"
pkgver=4.12.0
pkgrel=2
pkgdesc="A command line and GUI for packing textures"
arch=('any')
url="https://github.com/crashinvaders/gdx-texture-packer-gui"
license=('Apache')
depends=('java-runtime' 'unzip')
source=("https://github.com/crashinvaders/gdx-texture-packer-gui/archive/refs/tags/${pkgver}.zip")
sha256sums=('a25889f7942361fb6b997691a0af0698ac0d251b9e50994044c95c584db126dc')

build() {
	printf "#!/bin/sh\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar' \"\$@\"\n" >${pkgname}.sh
	cd ${srcdir}/${pkgname}-${pkgver}
	JAVA_HOME=/usr/lib/jvm/java-8-openjdk/ ./gradlew distRelease
}

package() {
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/distribution/output/gdx-texture-packer.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm755 "${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
}
