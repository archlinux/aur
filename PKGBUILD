# Maintainer: Daniel Landau <daniel@landau.fi>
# Contributor: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-now
pkgdesc="Now typeface by Alfredo Marco Pradil (OpenType)"
url='https://fontlibrary.org/en/font/now'
license=('custom:SIL Open Font License')
pkgver=1
pkgrel=2
depends=('fontconfig' 'xorg-font-utils' 'fontforge')
arch=('any')
install=$pkgname.install

source=(https://fontlibrary.org/assets/downloads/now/92f81dc6f3ba4a48ba3e70f5e826207d/now.zip
  convert.ff
)
sha512sums=('963899ef209fb9ccdc0548ee24710b43a6183f9b58224f6c3550ec00cb92a2c7d0930efa92aa90a0d3002814296ff86bfb02b9c630a62ceed72f1e233a105258'
            '3224a9e0ad2e7082ef04722711a9b4cb79baec4f1af505926ef8f0494047ce9636c9a1315d69e0c3b4bc0a66ac590f95764912bde913ad6183198d11aa3b7bcc')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 "${srcdir}/"*.otf "${pkgdir}/usr/share/fonts/OTF/"

  cd "${srcdir}"
  for f in *.otf
  do
    fontforge -script convert.ff $f 
  done
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -D -m644 "${srcdir}/OFL-FAQ.txt" "${pkgdir}/usr/share/licenses/${pkgname}/OFL-FAQ.txt"
}
