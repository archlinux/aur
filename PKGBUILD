# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=wg++
pkgver=5.0.1.1
pkgrel=4
pkgdesc="WebGrab+Plus is a multi-site incremental xmltv epg grabber"
arch=('any')
url="http://webgrabplus.com/"
license=('custom')
depends=('dotnet-runtime-6.0')
makedepends=('subversion')
provides=("wg++=${pkgver}")
conflicts=('wg++')
source=("http://www.webgrabplus.com/sites/default/files/download/SW/V4.2.2/WebGrabPlus_V4.2_install.tar.gz"
	"https://github.com/SilentButeo2/webgrabplus-siteinipack/raw/master/evaluation-builds/WebGrabPlus_V${pkgver}_eval_install.zip"
	"wgpp.sh")
sha256sums=('bea2b13a4a0ae253b6ecb8135abb39dc43dd1cd1acaf7c4cb4241f978874cb41'
            'c6b2e2337323d456cf6097d0e04ce154f709acfe2b9384259a982354cb852e8d'
            'fb57d376425f06a5d471bef556963828185aa86c78096bc597d54bb9eecd66c9')
_siteini="https://github.com/SilentButeo2/webgrabplus-siteinipack/trunk/siteini.pack"

prepare() {
	cd "${srcdir}"
	tar -xzf "WebGrabPlus_V${pkgver}_eval_install.tar.gz"
	rm -rf ".${pkgname}/siteini.pack.update"
	mv ".${pkgname}/mdb/mdb.config.example.xml" ".${pkgname}/mdb/mdb.config.xml"
	mv ".${pkgname}/rex/rex.config.example.xml" ".${pkgname}/rex/rex.config.xml"
	mv ".${pkgname}/" "${pkgname}/"
	cd "${srcdir}/${pkgname}"
	svn checkout ${_siteini}
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d "${pkgdir}/opt/"
	install -d "${pkgdir}/usr/share/"
	mkdir "${pkgdir}/opt/${pkgname}"
	cp -r --preserve=mode * "${pkgdir}/opt/${pkgname}"
	cp -r "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
	install -Dm755 "${srcdir}/wgpp.sh" "$pkgdir/usr/bin/${pkgname}"
}
