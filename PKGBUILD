# Maintainer: Katie Wolfe <~kt/public-inbox@lists.sr.ht>
pkgname=('plogue-aria' 'plogue-chipspeech' 'plogue-chipsounds' 'plogue-sforzando' 'plogue-tablewarp2')
pkgbase=plogue-plugins
pkgver='1.980_beta1~6'
debver='1.980~beta1-6'
license=('custom')
pkgrel=1
epoch=1
pkgdesc="Plogue audio plugins, beta Linux port (unofficial support, DO NOT report bugs upstream!)"
arch=('x86_64')
url="https://plogue.com"
options=('!strip')
install=plogue-plugins.install
source_x86_64=(
	"https://chipsounds.s3.us-east-1.amazonaws.com/LINUX_chipsounds_v${pkgver}_amd64.zip"
	"https://chipspeech.s3.us-east-1.amazonaws.com/LINUX_chipspeech_v${pkgver}_amd64.zip"
	"https://sforzando.s3.us-east-1.amazonaws.com/LINUX_sforzando_v${pkgver}_amd64.zip"
)
noextract=()
sha512sums_x86_64=('50ca51819fa47b00139e89ad7c60fd28d2d107a10991190921e17a4849731d45cb361e4b3dd9d00cc3895cea9f5b6f08f17f81c6633b4e6aa478da9fdec3e11e'
                   'a6d1d5981b3df44a06f78817be18e4e7b333440005b801bcfa52723c276f82a7273a503b051234e19d645fc727dcb256a77c6666a53c85b5f0e935233d2b5dd1'
                   'ac9090e625cb0b784512c80563d86b823f73d35f804d3b68449bf011d01550d338c7f0cd7fc0c6af10f34f889c22fd987c9ec4944a98e525dbe3c078d3e2e2f2')

debs=('aria' 'chipsounds' 'chipspeech' 'sforzando' 'tablewarp2')

prepare() {
	for p in "${debs[@]}"; do
		mkdir -p "plogue-$p"
		cd "plogue-$p"
		ar x "../plogue-${p}_${debver}_amd64.deb"
		cd ..
	done
}

package_plogue-aria() {
	# from deb: libgtk-3-0,libglib2.0-0,libpango-1.0-0,libcairo2,libpangocairo-1.0-0,curl
	depends=('gtk3' 'glib2' 'pango' 'cairo' 'curl' 'zenity')
	optdepends=('libsndfile: Adds support for more audio formats')

	dopkg
}

dopkg() {
	tar -C "${pkgdir}" -xJf "$pkgname/data.tar.xz"
	install -Dm 644 "${pkgdir}/usr/share/doc/${pkgname}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/copyright"
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
	dopkg
}

