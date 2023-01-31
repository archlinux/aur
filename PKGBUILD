# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>
pkgname=wg++
pkgver=5.0.1
pkgrel=1
pkgdesc='WebGrab+Plus is a freeware (license via donation) multi-site incremental XMLTV EPG grabber.'
arch=('any')
url='http://webgrabplus.com/'
license=('custom')
depends=('dotnet-runtime-6.0-bin')
makedepends=('git')
provides=('wg++')
conflicts=('wg++')
source=("http://www.webgrabplus.com/sites/default/files/download/SW/V4.2.2/WebGrabPlus_V4.2_install.tar.gz"
        "http://webgrabplus.com/sites/default/files/download/SW/V5.0.1/WebGrabPlus_V5.0.1_beta_install.tar.gz"
		"git+https://github.com/SilentButeo2/webgrabplus-siteinipack.git"
        "wg++.sh")
md5sums=('569b438673a4e1963c52f62c26bbcf16'
         '4b53c034a71ba316eb18d49fb4ca853b'
         'SKIP'
         'b9fc49688d55da5cf447b7a7b9a45361')

prepare() {
	cd "${srcdir}"
	rm -rf ".${pkgname}/siteini.pack.update"
	mv -f ".${pkgname}/mdb/mdb.config.example.xml" ".${pkgname}/mdb/mdb.config.xml"
	mv -f ".${pkgname}/rex/rex.config.example.xml" ".${pkgname}/rex/rex.config.xml"
	mv -f ".${pkgname}/" "${pkgname}/"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "${pkgdir}/opt/"
    install -d "${pkgdir}/usr/share/"
    mkdir "${pkgdir}/opt/${pkgname}"
	mkdir "${pkgdir}/opt/${pkgname}/siteini.pack"
    cp -r --preserve=mode * "${pkgdir}/opt/${pkgname}"
	cp -r --preserve=mode ../webgrabplus-siteinipack/siteini.pack/* "${pkgdir}/opt/${pkgname}/siteini.pack"
    cp -r "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/share/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}.sh" "$pkgdir/usr/bin/${pkgname}"
}