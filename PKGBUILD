# Maintainer: Oskar Gerlicz-Kowalczuk <oskar@gerlicz.space>
# Contributor: GI_Jack <GI_Jack@hackermail.com>
# Contributor: klein tux <reg-archlinux AT klein DOT tuxli DOT ch>

pkgname=spiderfoot
pkgver=4.0
pkgrel=4
pkgdesc="SpiderFoot is an open source intelligence automation tool for OSINT gathering"
arch=('any')
url="https://github.com/smicallef/spiderfoot"
license=('GPL2')

depends=(
  'python'
  'python-adblockparser'        # AUR
  'python-beautifulsoup4'
  'python-cherrypy'
  'python-cherrypy-cors'        # AUR
  'python-cryptography'
  'python-dnspython>=2.1.0'
  'python-docx'                 # AUR
  'python-exifread'             # AUR
  'python-ipwhois'              # AUR
  'python-lxml'
  'python-mako'
  'python-netaddr'
  'python-networkx'
  'python-openpyxl'
  'python-phonenumbers'
  'python-pptx'                 # AUR
  'python-publicsuffixlist'     # AUR
  'python-pygexf'               # AUR
  'python-pypdf2'               # AUR
  'python-pysocks'
  'python-pyopenssl'
  'python-requests'
  'python-secure'               # AUR
  'python-whois'                # AUR
  'python-yaml'
)

makedepends=(
  'python-setuptools-scm'
)

install=${pkgname}.install

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/smicallef/spiderfoot/archive/refs/tags/v${pkgver}.tar.gz"
  "spiderfoot.sh"
  "spiderfoot.service"
  "spiderfoot.default"
)

sha256sums=(
  'SKIP'
  '2246fe34cd61433a35cd49f2d6d18a6a66fd714014c6c703d1f1f29e3b2a5007'
  '98a4230a697def859e062c8a236b6e56dc8a3d2a11885e67464cfe8c837737a5'
  'b55ca3ad0243f3678ab0ed700fb0b3c5f901dfb9c364ba4ca12ed36267e3c32c'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m compileall .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/spiderfoot"
  cp -r . "${pkgdir}/usr/share/spiderfoot"

  install -Dm755 "${srcdir}/spiderfoot.sh" "${pkgdir}/usr/bin/spiderfoot"
  install -Dm644 "${srcdir}/spiderfoot.service" "${pkgdir}/usr/lib/systemd/system/spiderfoot.service"
  install -Dm644 "${srcdir}/spiderfoot.default" "${pkgdir}/etc/default/spiderfoot"
}
