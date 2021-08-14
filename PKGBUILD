# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgbase=svetovid-lib
pkgname=(svetovid-lib svetovid-lib-doc)
pkgver=0.5.0
_commit=b7c003f8b277ed19be23b674c656b73b262e5769
pkgrel=3
pkgdesc='Supplement Library for Introductory Programming Courses'
arch=(any)
url='https://github.com/ivanpribela/svetovid-lib'
license=('APACHE')
depends=('java-runtime')
makedepends=('ant' 'inkscape' 'git')
source=("git+https://github.com/ivanpribela/svetovid-lib#commit=${_commit}")
sha512sums=('SKIP')

build() {
	cd "${pkgname}"

	ant pack.jar
	ant generate.apidoc
}

package_svetovid-lib() {
	cd "${pkgname}"

	install -Dm644 "dist/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

package_svetovid-lib-doc() {
	cd "${pkgbase}"

	install -dm755 "${pkgdir}/usr/share/doc"
	cp -a "gendoc/api" "${pkgdir}/usr/share/doc/${pkgbase}"
}
