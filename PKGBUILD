# Contributor: bohoomil <@zoho.com>

pkgname=gsfonts-cyr
pkgname_org=urw-fonts
pkgver=2.4
_fedorarel=17.fc20
pkgrel=2
pkgdesc='URW and Postscript core35 fonts with Cyrillic support'
url='http://sourceforge.net/projects/gs-fonts/'
arch=('any')
license=('GPL2')
makedepends=('rpmextract')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('gsfonts' 't1-urw-fonts-ib' 't1-urw-fonts-cyr-ib')
provides=('gsfonts' 't1-urw-fonts-ib' 't1-urw-fonts-cyr-ib')
install=$pkgname.install
source=("http://kojipkgs.fedoraproject.org/packages/${pkgname_org}/${pkgver}/${_fedorarel}/src/${pkgname_org}-${pkgver}-${_fedorarel}.src.rpm"
        29-metric-aliases-cyr.conf
        36-repl-global-cyr.conf
        45-urw-fonts-cyr.conf
        59-latin-cyr.conf
        90-non-tt-urw-fonts-cyr.conf
        README_IB)
sha1sums=('0066723d9cd086cfdaecc57f7b216545a50924dd'
          '55d922471acee0cc3e2476c71a71deec5616cd5a'
          'e30b667954cb8e4a07810a1fcfd3c861b0289c8a'
          '5f96002a53d4eddbd23c9b0991cc3c332b29e8c3'
          'b863decf687afd51bdc14150b1c2919611e878b1'
          '9ec26822d826d9ca6efa11b4e7810d5c8a280101'
          '03a20097452894cfe4d58c1f94cc5c46fe88a873')

build() {
  cd "${srcdir}"
  rpmextract.sh "${pkgname_org}-${pkgver}-${_fedorarel}.src.rpm"
  bsdtar xf *.tar.bz2
}

package() {
  cd "${srcdir}"

  install -m755 -d "${pkgdir}/usr/share/fonts/Type1"
  install -m644 *.{pfb,pfm,afm} "${pkgdir}/usr/share/fonts/Type1"

  # additional config files for infinality-bundle users
  install -m755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "${srcdir}"/*.conf "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 "${srcdir}"/README_IB "${pkgdir}/usr/share/doc/${pkgname}/README"
}
