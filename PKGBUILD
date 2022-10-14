# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=wg++
pkgver=5.0
pkgrel=1
pkgdesc='WebGrab+Plus is a freeware (license via donation) multi-site incremental XMLTV EPG grabber.'
arch=('any')
url='http://webgrabplus.com/'
license=('custom')
depends=(
	'dotnet-host'
	'dotnet-runtime'
	)
makedepends=('git')
provides=('wg++')
source=("http://www.webgrabplus.com/sites/default/files/download/SW/V4.2.2/WebGrabPlus_V4.2_install.tar.gz"
        "http://webgrabplus.com/sites/default/files/download/SW/V5.0.1/WebGrabPlus_V5.0.1_beta_install.tar.gz"
	"git+https://github.com/SilentButeo2/webgrabplus-siteinipack.git"
        "wg++")

md5sums=('569b438673a4e1963c52f62c26bbcf16'
         '4b53c034a71ba316eb18d49fb4ca853b'
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
