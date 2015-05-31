# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=the-entertainment
pkgver=1
pkgrel=1
pkgdesc="The Entertainment - Kentucky Route Zero"
arch=(i686 x86_64)
url="http://kentuckyroutezero.com/the-entertainment/"
license=('custom')
depends=(libgl)
source=(http://kentuckyroutezero.com/the-entertainment/TheEntertainment_Linux.zip
        the-entertainment.desktop
        the-entertainment.png)
md5sums=('025c9455b1501ab029c979c22c0a4d45'
         'ea2aaac64fb39dc1bd7b843447d15a1a'
         '0419c3664dfb775393b30459d6d2d0a8')

package() {
  cd "${srcdir}"
  
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/the-entertainment
  mkdir -p "${pkgdir}"/usr/share/{applications,icons}
  
  cp "${srcdir}"/TheEntertainment_Data "${pkgdir}"/usr/share/the-entertainment -R
  
  if [ "${CARCH}" = "x86_64" ]; then
    install -m755 "${srcdir}"/TheEntertainment.x86_64 "${pkgdir}"/usr/share/the-entertainment/TheEntertainment
  else
    install -m755 "${srcdir}"/TheEntertainment.x86 "${pkgdir}"/usr/share/the-entertainment/TheEntertainment
  fi
  
  find "${pkgdir}/usr/share/the-entertainment" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/the-entertainment" -type f -exec chmod 644 "{}" \;
  
  install -m644 "${srcdir}"/the-entertainment.png "${pkgdir}"/usr/share/icons
  install -m644 "${srcdir}"/the-entertainment.desktop "${pkgdir}"/usr/share/applications
  
  chmod +x "${pkgdir}"/usr/share/the-entertainment/TheEntertainment
  
  ln -s /usr/share/the-entertainment/TheEntertainment "${pkgdir}"/usr/bin/the-entertainment
}
