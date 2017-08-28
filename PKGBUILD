# Maintainer: bohoomil <@zoho.com>

pkgname=ttf-courier-prime-ib
pkgver=1.203
pkgrel=9
depends=('fontconfig')
pkgdesc="A free, improved, classical monospaced typeface."
url="http://quoteunquoteapps.com/courierprime/"
arch=('any')
groups=('infinality-bundle-fonts')
conflicts=('ttf-courier-prime')
replaces=('ttf-courier-prime')
provides=('t1-ibm-courier-ib')
license=('custom:OFL')
source=('http://dimkanovikov.pro/courierprime/courierprime.zip'
        45-courier-prime.conf
        90-tt-courier-prime.conf)
sha1sums=('1dc74002d53c2d32b3b2f28c0fe24a51bbc05412'
          '718837e1ac40010d446d9c4e8817d221abc3041e'
          '5b774e915c204364eb9d1bf580264de991c084a4')

package() {
  install -m755 -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  find . -type f -name \*.ttf -exec install -Dm644 '{}' \
    "${pkgdir}"/usr/share/fonts/"${pkgname}" \;

  cd "${srcdir}"
  install -D -m644 45-courier-prime.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-courier-prime.conf
  install -D -m644 90-tt-courier-prime.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-courier-prime.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-courier-prime.conf .
  ln -s ../conf.avail/90-tt-courier-prime.conf .
}
