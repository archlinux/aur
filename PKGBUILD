# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=limits-and-demonstrations
pkgver=1
pkgrel=2
pkgdesc="A Lula Chamberlain Retrospective - Kentucky Route Zero"
arch=(x86_64)
url="http://kentuckyroutezero.com/limits-and-demonstrations/"
license=('custom')
depends=(libgl)
source=(https://sloth.cardboard.computer/zero/supermarine-walrus/TheEntertainment-Linux.zip
        limits-and-demonstrations.desktop
        limits-and-demonstrations.png)
sha256sums=('b2a09ad6b423f4d1a92192af41971677de99334a0c31d6c7fc5f837ad559959e'
            'e555c2a0fba95522552807e9601c06dde31cb499166310f173381c75def1bc1a'
            '601a62c0aa84259e8e6001f94e00adbaf5fffdbdc4426d60a3a26d70b69ab01b')

package() {
  cd "${srcdir}"
  
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/limits-and-demonstrations
  mkdir -p "${pkgdir}"/usr/share/{applications,icons}
  
  cp "${srcdir}"/LimitsAndDemonstrations_Data "${pkgdir}"/usr/share/limits-and-demonstrations -R
  
  if [ "${CARCH}" = "x86_64" ]; then
    install -m755 "${srcdir}"/LimitsAndDemonstrations.x86_64 "${pkgdir}"/usr/share/limits-and-demonstrations/LimitsAndDemonstrations
  else
    install -m755 "${srcdir}"/LimitsAndDemonstrations.x86 "${pkgdir}"/usr/share/limits-and-demonstrations/LimitsAndDemonstrations
  fi
  
  find "${pkgdir}/usr/share/limits-and-demonstrations" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/limits-and-demonstrations" -type f -exec chmod 644 "{}" \;
  
  install -m644 "${srcdir}"/limits-and-demonstrations.png "${pkgdir}"/usr/share/icons
  install -m644 "${srcdir}"/limits-and-demonstrations.desktop "${pkgdir}"/usr/share/applications
  
  chmod +x "${pkgdir}"/usr/share/limits-and-demonstrations/LimitsAndDemonstrations
  
  ln -s /usr/share/limits-and-demonstrations/LimitsAndDemonstrations "${pkgdir}"/usr/bin/limits-and-demonstrations
}
