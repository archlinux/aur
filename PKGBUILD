# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=tldp-xsl
pkgver=04MAR2005
pkgrel=1
pkgdesc="DocBook XSL stylesheets customized for the Linux Documentation Project"
arch=('any')
license=('FDL')
url='http://www.happy-monkey.net/docbook/'
depends=('docbook-xsl')
install=tldp-xsl.install
source=("https://web.archive.org/web/20060711151557id_/http://www.happy-monkey.net/docbook/tldp/tldp-xsl-${pkgver}.tar.gz"
        "fix-link.patch")
sha512sums=('8bc08175983b74896bd95026ccd8de236c9c85717bb64b54a23ec1c29aaec852740ed172b4afca1c6c543246679f07e5f07185c988d127e54757b632129f1c88'
            'e885f499103f496384a743ca838954a45d529b800cc8a15da45f5d175185665daf7f34647fc30f21814d677e8b47758ed53e778d3020872b74896323f65fcb18')

prepare() {
  cd "${srcdir}/tldp-xsl-${pkgver}"

  patch -Np1 < "${srcdir}/fix-link.patch"
}

package() {
  cd "${srcdir}/tldp-xsl-${pkgver}"

  install -dm755 "${pkgdir}/etc/xml"
  install -dm755 "${pkgdir}/usr/share/xml/docbook/tldp-xsl-${pkgver}"
  cp -r "fo" "html" "${pkgdir}/usr/share/xml/docbook/tldp-xsl-${pkgver}/"
  install -Dm755 -t "${pkgdir}/usr/share/doc/tldp-xsl/" "doc/tldp-xsl-howto."* "doc/style.css"
}
