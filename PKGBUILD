# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=spiderfoot
pkgver=3.0
pkgrel=1
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
	   'python-secure' 'python-pygexf' 'python-adblockparser')
makedepends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/smicallef/spiderfoot/archive/v${pkgver}.tar.gz"
	"spiderfoot.sh"
	"spiderfoot.service"
	"spiderfoot.default")
sha256sums=('bc8048ead13ab02d24155c9d8426f3ec15efb7adc9ce585de796ea34df1808ad'
            '2246fe34cd61433a35cd49f2d6d18a6a66fd714014c6c703d1f1f29e3b2a5007'
            '416dfddbc1e0910a939730c645cb385ed05cc7df1c2fdb094e1a696871e0bf61'
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

