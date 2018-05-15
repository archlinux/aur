# Maintainer: AsamK <asamk ät gmx de>

pkgname=i18n-editor
pkgver=1.0.0
pkgrel=1
pkgdesc='GUI for editing your i18n translation files'
arch=('any')
url="https://github.com/jcbvm/i18n-editor"
license=('MIT')
depends=('java-runtime')
makedepends=('java-environment=8' 'maven')
source=("https://github.com/jcbvm/i18n-editor/archive/${pkgver}.tar.gz"
        "${pkgname}.sh")
sha512sums=('58157564f8908cbf13c801d905372a1ad42fe31f6de0fd435ff00ce5f1da7ec7edd7bdafb193541e8a0337d16727816a5dc45e46b93185e314d2fa0be342116e'
            '79f28fe55f04ec0787f7be3105832c9696bea5123eb158a9932aed816686cd8d7b813e87e665b1a90e8f869cb43fa05931eb9a9a906a674fc612ed307965d0f0')

build() {
	cd "${srcdir}"
	cd "${pkgname}-${pkgver}"

	mvn install
}

package() {
	install -m755 -d "${pkgdir}/usr/bin" \
	                 "${pkgdir}/usr/share/java/${pkgname}/"

	cd "${srcdir}"

	install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	cd "${pkgname}-${pkgver}"

	install -m644 "target/${pkgname}-${pkgver}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/"
}
