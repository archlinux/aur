# Maintainer: Gerard Louw <gerardlouw@gmail.com>
pkgname=('plogue-aria' 'plogue-chipspeech' 'plogue-chipsounds' 'plogue-sforzando' 'plogue-tablewarp2')
pkgbase=plogue-plugins
pkgver='1.982'
debver='1.982'
license=('custom')
pkgrel=1
epoch=1
pkgdesc="Plogue audio plugins, beta Linux port (unofficial support, DO NOT report bugs upstream!)"
arch=('x86_64')
url="https://plogue.com"
options=('!strip')
install=plogue-plugins.install
source_x86_64=(
	"https://chipsounds.s3.us-east-1.amazonaws.com/LINUX_plogue-chipsounds_${pkgver}_x86_64.zip"
	"https://chipspeech.s3.us-east-1.amazonaws.com/LINUX_plogue-chipspeech_${pkgver}_x86_64.zip"
	"https://sforzando.s3.us-east-1.amazonaws.com/LINUX_plogue-sforzando_${pkgver}_x86_64.zip"
)
noextract=()
sha512sums_x86_64=('ec30b0d8ca8ac9d2d082d2c03d5e3e6b09745e4a6c0c87d180cb1d7604cacd5474c469b748aa8d10641b2ed20bc44cde4cee9504947601fde51a9a33bb49eb3d'
                   '32d1507f2a889209077111b5bacbe556e47dfc8c7848edb009ca422ef607b94d6bd793cd62964d501f4c5e44f8e7cada5d7fcd9bbcc5f72f9913bbc4aad15584'
                   '7c472244d8c0968b82e5b40d10f22822bebbc3c82bf0bbc6031e98da7b26bc0662881255239bbb1afe29a6690de727174c801f39ac0e26439a93a56f4cf861a8')

dopkg() {
	mkdir -p "${pkgname}"
	ar x "LINUX_${1:-${pkgname}}_${pkgver}_x86_64/${pkgname}_${debver}_amd64.deb" "data.tar.xz" --output="${pkgname}"
	tar -C "${pkgdir}" -xJf "${pkgname}/data.tar.xz"
	install -Dm 644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
}
package_plogue-aria() {
	# from deb: libgtk-3-0,libglib2.0-0,libpango-1.0-0,libcairo2,libpangocairo-1.0-0,curl
	depends=('gtk3' 'glib2' 'pango' 'cairo' 'curl' 'zenity')
	optdepends=('libsndfile: Adds support for more audio formats')
	dopkg plogue-sforzando
}
package_plogue-chipspeech() {
	depends=('plogue-aria')
	dopkg
}
package_plogue-chipsounds() {
	depends=('plogue-aria')
	dopkg
}
package_plogue-sforzando() {
	depends=('plogue-aria')
	dopkg
}
package_plogue-tablewarp2() {
	depends=('plogue-aria')
	dopkg plogue-sforzando
}

