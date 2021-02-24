# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=spiderfoot
pkgver=3.3
pkgrel=2
pkgdesc="SpiderFoot is an open source intelligence automation tool. Its goal is to automate the process of gathering intelligence about a given target."
arch=('any')
url="http://www.spiderfoot.net/"
license=('GPLv2')
depends=( 'python' 'python-dnspython' 'python-exifread' 'python-cherrypy'
	  'python-mako' 'python-beautifulsoup4' 'python-lxml' 'python-netaddr'
	   'python-pysocks' 'python-requests' 'python-ipwhois'
	   'python-ipaddress' 'python-phonenumbers' 'python-pypdf2'
	   'python-stem' 'python-whois' 'python-future' 'python-pyopenssl'
	   'python-docx' 'python-pptx' 'python-networkx' 'python-cryptography'
	   'python-secure' 'python-pygexf' 'python-adblockparser'
	   'python-publicsuffixlist' 'python-cherrypy-cors')
makedepends=('python')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/smicallef/spiderfoot/archive/v${pkgver}.tar.gz"
	"spiderfoot.sh"
	"spiderfoot.service"
	"spiderfoot.default")
sha256sums=('1f57ca7df306bc71e74229eb5e1679aee3ec58bff852c75a07e3b42aef6660b9'
            '2246fe34cd61433a35cd49f2d6d18a6a66fd714014c6c703d1f1f29e3b2a5007'
            '98a4230a697def859e062c8a236b6e56dc8a3d2a11885e67464cfe8c837737a5'
            'b55ca3ad0243f3678ab0ed700fb0b3c5f901dfb9c364ba4ca12ed36267e3c32c')
build() {
  cd "${pkgname}-${pkgver}"
  python -m compileall *.py
}


package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/spiderfoot"
  cp -r * "${pkgdir}/usr/share/spiderfoot"
  install -Dm755 "${srcdir}/spiderfoot.sh" "${pkgdir}/usr/bin/spiderfoot"
  install -Dm644 "${srcdir}/spiderfoot.service" "${pkgdir}/usr/lib/systemd/system/spiderfoot.service"
  install -Dm644 "${srcdir}/spiderfoot.default" "${pkgdir}/etc/default/spiderfoot"
}

