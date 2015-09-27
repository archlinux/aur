# Original maintainer Alex Talker < Alextalker at openmailbox dot com >
# Support Maintainer Filip Brcic < brcha at gna dot org >
# Contributor bitwave < aur [at] oomlu [d0t] de >
# Alex say thanks to Filip about support this package while he was away from Arch.
pkgname=multidoge
pkgver=0.1.4
pkgrel=1
pkgdesc="Java-based DogeCoin client"
arch=('i686' 'x86_64')
url="http://${pkgname}.org"
license=('GPL')
conflicts=("${pkgname}")
provides=("${pkgname}")
depends=('java-runtime' 'bash')
source=("https://github.com/langerhans/${pkgname}/releases/download/v${pkgver}/multidoge-${pkgver}-linux.jar"
        ${pkgname}
        install.properties
        ${pkgname}.desktop
        dogecoin.png)
md5sums=('0ed8eb0caf2e14eb9918ee6037629794'
         '937bebe7bdda35b2089415fbe0c79926'
         'ecb77c4f6857760ac0bb278b2771ee1c'
         'd66bfe1d4f5856dccc93e7e63d3f9f4d'
         'de465c84e7b5169b6b2aa77d4948adb6')
noextract=("${pkgname}-${pkgver}-linux.jar")
package() {
	msg "Install package..."
	cd ${srcdir}
	#bugfix causing the izpack installer to return an error
	java -jar ${pkgname}-${pkgver}-linux.jar -options install.properties || true

	install -Dm 644 tmp-install/${pkgname}-exe.jar ${pkgdir}/usr/share/java/multidoge/multidoge.jar
	install -Dm 755 ${pkgname} ${pkgdir}/usr/bin/multidoge

        install -Dm 644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/multidoge.desktop
        install -Dm 644 dogecoin.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png

	msg "Done!"
}
