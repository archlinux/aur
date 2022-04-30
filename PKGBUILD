# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=wg++
pkgver=4.2
pkgrel=3
pkgdesc='WebGrab+Plus is a freeware (license via donation) multi-site incremental XMLTV EPG grabber.'
arch=('any')
url='http://webgrabplus.com/'
license=('custom')
depends=(
	'dotnet-host-bin'
	'dotnet-runtime-5.0-bin'
	)
makedepends=('git')
provides=('wg++')
source=("http://webgrabplus.com/sites/default/files/download/SW/V4.2.2/WebGrabPlus_V4.2_install.tar.gz"
        "https://github.com/SilentButeo2/webgrabplus-siteinipack/raw/master/evaluation-builds/WebGrabPlus_V4.2.2.3_eval_install.tar.gz"
	"git+https://github.com/SilentButeo2/webgrabplus-siteinipack.git"
        "wg++")

md5sums=('569b438673a4e1963c52f62c26bbcf16'
         '8d106d05122e5d57c0d4e94c09cea87c'
         'SKIP'
         'b9fc49688d55da5cf447b7a7b9a45361')

package() {
	# Install application files
	mkdir -p "${pkgdir}/opt/wg++"
	cp -r "${srcdir}/.wg++/bin.net" "${pkgdir}/opt/wg++/"
	cp -r "${srcdir}/.wg++/doc" "${pkgdir}/opt/wg++/"
	cp -r "${srcdir}/webgrabplus-siteinipack/siteini.pack" "${pkgdir}/opt/wg++/"

	# Install configuration files
	mkdir -p "${pkgdir}/usr/share/wg++"
	cp -r "${srcdir}/webgrabplus-siteinipack/siteini.pack" "${pkgdir}/usr/share/wg++/siteini.pack"
	cp -r "${srcdir}/.wg++/bin.net" "${pkgdir}/usr/share/wg++/"	
	cp -r "${srcdir}/.wg++/mdb" "${pkgdir}/usr/share/wg++/"
	mv "${pkgdir}/usr/share/wg++/mdb/mdb.config.example.xml" "${pkgdir}/usr/share/wg++/mdb/mdb.config.xml"
	cp -r "${srcdir}/.wg++/rex" "${pkgdir}/usr/share/wg++/"
	mv "${pkgdir}/usr/share/wg++/rex/rex.config.example.xml" "${pkgdir}/usr/share/wg++/rex/rex.config.xml"
	cp -r "${srcdir}/.wg++/siteini.user" "${pkgdir}/usr/share/wg++/"
	cp -n "${srcdir}/.wg++/WebGrab++.config.example.xml" "${pkgdir}/usr/share/wg++/WebGrab++.config.xml"

	# Executable
	install -Dm755 "${srcdir}/wg++" "${pkgdir}/usr/bin/wg++"
}
