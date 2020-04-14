# Maintainer: Daniel Landau <daniel@landau.fi>
# Contributor: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-futura-renner
pkgdesc="A digital version of Futura"
url='https://fontlibrary.org/en/font/futura-renner'
license=('custom:SIL Open Font License')
pkgver=1
pkgrel=1
depends=('fontconfig' 'xorg-font-utils' 'fontforge')
arch=('any')
install=$pkgname.install

source=(https://fontlibrary.org/assets/downloads/futura-renner/951a69f210c7e73b8d89c27bcd07320a/futura-renner.zip
  convert.ff
)
sha512sums=('7f4f9a8299364778357cec0cb76dd40ece3c137c477e38259d95d7ac07caa2b34f8f0cbe807445d6a9f8a0dd362eca542b9753c22839a517137a3d142dd21a97'
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
