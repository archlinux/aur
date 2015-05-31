# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=limits-and-demonstrations
pkgver=1
pkgrel=1
pkgdesc="A Lula Chamberlain Retrospective - Kentucky Route Zero"
arch=(i686 x86_64)
url="http://kentuckyroutezero.com/limits-and-demonstrations/"
license=('custom')
depends=(libgl)
source=(http://kentuckyroutezero.com/limits-and-demonstrations/LimitsAndDemonstrations_LINUX.zip
        limits-and-demonstrations.desktop
        limits-and-demonstrations.png)
md5sums=('427775cc193f58d225f06fb3fbdfeaad'
         'ba5859dc49a124c21654711b325dedd9'
         '2377b27b5c95bba8fc7c6cd2ea92fe25')

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
