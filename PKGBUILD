# Wuala: Installer: Arch
# Maintainer: Sven Schober <sschober (at) sssm (dot) de>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Maintainer: SanskritFritz (gmail)

pkgname=wuala
pkgver=1
pkgrel=20150323
epoch=1
pkgdesc="A new way of storing, sharing and publishing files on the Internet.  It's free, simple and secure."
arch=("any")
url="http://www.wuala.com/"
license=("custom")
depends=("java-runtime" "rpcbind" "nfs-utils")
options=(!emptydirs)
source=("http://cdn.wuala.com/repo/other/wuala.tar.gz"
	"0001-fix-loader3-location.patch"
	"${pkgname}.png"
	"${pkgname}.desktop"
	"LICENSE")

prepare() {
	cd "${srcdir}/${pkgname}"
	patch -Np1 -i "${srcdir}/0001-fix-loader3-location.patch"
}

package() {
	cd "${srcdir}/${pkgname}"

	JAVA_DIR="${pkgdir}/usr/share/java/${pkgname}"
	DOC_DIR="${pkgdir}/usr/share/doc/${pkgname}"
	BIN_DIR="${pkgdir}/usr/bin"

	# Directories
	install -d "${JAVA_DIR}" "${DOC_DIR}" "${BIN_DIR}"

	# binary
	install -D wuala{,cmd} "${pkgdir}/usr/bin/"

	# jar
	install -D loader3.jar "${JAVA_DIR}/"

	# readme and copyright
	install -D readme.txt copyright "${DOC_DIR}"

	# Desktop
	install -D "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"

	# License
	install -D "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('91192a3bc4d345a034b86e2fe95d3dd7'
         '37f5021c623c4b2fcad6d274a05de0dd'
         '5c0d0ec01eaa7075fc7e3197d2a0a2ee'
         '6073b5fdda17ab8b423bde329adfa80f'
         '1085f1b2c391b8c72cb4b53b15191336')

