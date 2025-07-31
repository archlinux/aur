# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=the-entertainment
pkgver=1
pkgrel=2
pkgdesc="The Entertainment - Kentucky Route Zero"
arch=(i686 x86_64)
url="http://kentuckyroutezero.com/the-entertainment/"
license=('custom')
depends=(libgl)
source=(https://sloth.cardboard.computer/zero/supermarine-walrus/TheEntertainment-Linux.zip
        the-entertainment.desktop
        the-entertainment.png)
sha256sums=('b2a09ad6b423f4d1a92192af41971677de99334a0c31d6c7fc5f837ad559959e'
            '4594e2440ee680880bd8bf058ff77feed2a0ac4ae3c8c74bfe1ba22db0f71217'
            '1fe7153cf8f10a74c94798da813319efbb806a23de5f43c14696002b8ce79757')

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
