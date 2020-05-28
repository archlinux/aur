# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-vollkorn-ibx
pkgdesc="Vollkorn typeface by Friedrich Althausen. TrueType version"
url=http://vollkorn-typeface.com/
license=('custom:OFL')
pkgver=3.005
pkgrel=5
depends=('fontconfig')
conflicts=('ttf-vollkorn' 'otf-vollkorn' 'otf-vollkorn-ibx')
groups=('infinality-bundle-fonts-extra')
arch=('any')
source=(http://vollkorn-typeface.com/download/vollkorn-${pkgver//./-}.zip
        45-vollkorn.conf
        90-tt-vollkorn.conf)
sha1sums=('d65b1a5f61c9d84ef52e68ff699304351444e794'
          'df82e0351eeae835feed489dc3394d0250d7b338'
          'd6ac389486b0ed4439cde58fdd46df85a6c1a007')

package() {
  cd "${srcdir}"

  install -D -m644 "OpenFontLicense.txt" \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING
  install -D -m644 Fontlog.txt \
    "${pkgdir}"/usr/share/doc/"${pkgname}"/Fontlog.txt
  install -d "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 TTF/*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -m755 -d "${pkgdir}"/etc/fonts/conf.avail
  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  install -m644 45-vollkorn.conf \
    "${pkgdir}"/etc/fonts/conf.avail/45-vollkorn.conf
  install -m644 90-tt-vollkorn.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-vollkorn.conf

  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/45-vollkorn.conf .
  ln -s ../conf.avail/90-tt-vollkorn.conf .
}
