# Maintainer: bohoomil <@zoho.com>

pkgname=ttf-raleway-ibx
pkgver=3.0
pkgrel=6
depends=('fontconfig')
pkgdesc="Raleway is an elegant sans-serif typeface family, initially designed by Matt McInerney, later expanded by Pablo Impallari and Rodrigo Fuenzalida. TrueType version."
url="http://www.impallari.com/"
arch=('any')
license=('custom:OFL')
conflicts=('otf-raleway' 'ttf-impallari-raleway-family' 'ttf-raleway-font-family' 'otf-raleway-ibx')
groups=('infinality-bundle-fonts-extra')
source=("http://www.impallari.com/media/uploads/prosources/update-100-source.zip"
        45-raleway.conf
        90-tt-raleway.conf)
sha1sums=('986434193552179b6b58346d140d0806a0a891d8'
          'c7a432f074c3c4f0182c10900dc614f7dd538bc9'
          'b7746cb9b033395e75f7c937ec25fbc1678642e1')

package() {
  cd "${srcdir}"/"raleway-family-v3.0"

  install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install -m644 OFL.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 ../45-raleway.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-raleway.conf
  install -m644 ../90-tt-raleway.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-raleway.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-raleway.conf .
  ln -s ../conf.avail/90-tt-raleway.conf .
}
