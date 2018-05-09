# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Manuel Mendez <mmendez534@gmail.com>
# Submitter: Robin Martinjak <rob@kingofnerds.net>

# vim:set ts=2 sw=2 et:

pkgname='makeself'
pkgver='2.4.0'
pkgrel='1'
pkgdesc='Utility to create self-extracting packages'
arch=('any')
url='http://megastep.org/makeself'
license=('GPL')
depends=('bash')
source=("${pkgname}-release-${pkgver}.tar.gz::https://github.com/megastep/${pkgname}/archive/release-${pkgver}.tar.gz")
sha256sums=('76a8c3f3fad1b55c39ba2904a19e74962151f9481df03091d4e54938bdd13f50')
sha512sums=('f45e349adfb329e75f5fee0053c54e06c7004c12824c935a73a9b9895acb569b339a1acc3ee2b6d69e65cf797120e9d0502ebb6fcceb72fa166cf92f802b1eca')

prepare() {
  cd "${pkgname}-release-${pkgver}"
  sed -e 's|^HEADER=.*|HEADER=/usr/share/makeself/makeself-header.sh|' -i 'makeself.sh'
}

package() {
  cd "${pkgname}-release-${pkgver}"
  install -Dpm644 'makeself.lsm' 'README.md' -t "${pkgdir}/usr/share/${pkgname}/"
  install -Dpm644 'makeself.1' -t "${pkgdir}/usr/share/man/man1/"
  install -Dpm755 'makeself.sh' "${pkgdir}/usr/bin/makeself"
  install -Dpm755 'makeself-header.sh' -t "${pkgdir}/usr/share/${pkgname}/"
}

