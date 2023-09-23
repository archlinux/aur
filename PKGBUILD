# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=wg++
pkgver=5.1.2
pkgrel=1
pkgdesc="WebGrab+Plus is a multi-site incremental xmltv epg grabber"
arch=('any')
url="http://webgrabplus.com/"
license=('custom')
depends=('dotnet-runtime-7.0')
makedepends=('subversion')
source=(
	"${pkgname}-5.1.0.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V5.1.0/WebGrabPlus_V5.1_install.tar_0.gz"
	"${pkgname}-${pkgver}.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V5.1.2/WebGrabPlus_V5.1.2_beta_install.tar.gz"
	"wgpp.sh"
	"svn+https://github.com/SilentButeo2/webgrabplus-siteinipack/trunk/siteini.pack"
)
sha256sums=('368b14be4b0ec724ac394b59b26c05ecff3cef2864572a8cca844d56e1ce6f0f'
            'bca1eeabe46012690f833b5091595b4d8298ff07919dca55f0231c8f90ed57ea'
            'fb57d376425f06a5d471bef556963828185aa86c78096bc597d54bb9eecd66c9'
            'SKIP')

prepare() {
	cd "${srcdir}"
	cp -r "siteini.pack" ".${pkgname}/"
	mv ".${pkgname}" "${pkgname}"
	rm -rf "${pkgname}/siteini.pack.update" "${pkgname}/siteini.pack/.makepkg"
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d "${pkgdir}/opt/${pkgname}"
	install -d "${pkgdir}/usr/share/"
	cp -r --preserve=mode * "${pkgdir}/opt/${pkgname}"
	cp -r "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
	install -Dm755 "${srcdir}/wgpp.sh" "${pkgdir}/usr/bin/${pkgname}"
}
