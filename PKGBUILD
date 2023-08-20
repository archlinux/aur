# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=wg++
pkgver=5.1.0
pkgrel=1
pkgdesc="WebGrab+Plus is a multi-site incremental xmltv epg grabber"
arch=('any')
url="http://webgrabplus.com/"
license=('custom')
depends=('dotnet-runtime')
makedepends=('subversion')
provides=("wg++=${pkgver}")
conflicts=('wg++')
source=(
	"${pkgname}-${pkgver}.tar.gz::http://webgrabplus.com/sites/default/files/download/SW/V5.1.0/WebGrabPlus_V5.1_install.tar_0.gz"
	"wgpp.sh"
	"svn+https://github.com/SilentButeo2/webgrabplus-siteinipack/trunk/siteini.pack"
)
sha256sums=('368b14be4b0ec724ac394b59b26c05ecff3cef2864572a8cca844d56e1ce6f0f'
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
