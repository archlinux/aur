# Maintainer: Erikas Rudinskas <erikmnkl@gmail.com>

pkgname=wg++
pkgver=2.1.0_20180620130845
_pkgver=2018.06.20_130845
pkgrel=1
pkgdesc='WebGrab+Plus is a free multi-site incremental XMLTV EPG grabber.'
arch=('any')
url='http://webgrabplus.com/'
license=('custom')
depends=('mono')
provides=('wg++')
source=("http://webgrabplus.com/sites/default/files/download/SW/V2.1.0/WebGrabPlus_V2.1_install.tar.gz"
	"http://webgrabplus.com/sites/default/files/download/ini/SiteIni.Pack_$_pkgver.zip"
        "wg++")  
md5sums=("837d35bc377c1dc134c26a044bcee479"
	 "2c1011a222fe7b3211d710b89be06a7f"
	 "96ddf77a84554bb457dab4fd63e82ae6")

package() {
	# Install application files:
	mkdir -p "${pkgdir}/opt/wg++"
	cp -R "${srcdir}/.wg++/bin" "${pkgdir}/opt/wg++/"
	cp -R "${srcdir}/.wg++/doc" "${pkgdir}/opt/wg++/"

	cp -R "${srcdir}/siteini.pack" "${pkgdir}/opt/wg++/"

	# Install configuration files:
	mkdir -p "${pkgdir}/usr/share/wg++"

	ln -s "/opt/wg++/siteini.pack" "${pkgdir}/usr/share/wg++/siteini.pack"

	cp -R "${srcdir}/.wg++/mdb" "${pkgdir}/usr/share/wg++/"
	mv "${pkgdir}/usr/share/wg++/mdb/mdb.config.example.xml" "${pkgdir}/usr/share/wg++/mdb/mdb.config.xml"

	cp -R "${srcdir}/.wg++/rex" "${pkgdir}/usr/share/wg++/"
	mv "${pkgdir}/usr/share/wg++/rex/rex.config.example.xml" "${pkgdir}/usr/share/wg++/rex/rex.config.xml"

	cp -R "${srcdir}/.wg++/siteini.user" "${pkgdir}/usr/share/wg++/"

	cp -R "${srcdir}/.wg++/WebGrab++.config.example.xml" "${pkgdir}/usr/share/wg++/WebGrab++.config.xml"

	# Executable:
	install -Dm755 "${srcdir}/wg++" "${pkgdir}/usr/bin/wg++"
}
