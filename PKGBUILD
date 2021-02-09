# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=here-and-there-along-the-echo
pkgver=1
pkgrel=3
pkgdesc="Here And There Along The Echo - Kentucky Route Zero"
arch=(i686 x86_64)
url="http://kentuckyroutezero.com/here-and-there-along-the-echo/"
license=('custom')
depends=(libgl)
source=(http://kentuckyroutezero.com/here-and-there-along-the-echo/HereAndThereAlongTheEcho_Linux.zip
        here-and-there-along-the-echo.desktop
        here-and-there-along-the-echo.png)
md5sums=('5b9f637e8fd8a9b5645a56112153f85d'
         'b44bea8432b5e799a7aea0edb0dcc77e'
         'ece748a2b124069db050b4651cd61c17')
PKGEXT=.pkg.tar
package() {
  cd "${srcdir}"
  
  mkdir -p "${pkgdir}"/usr/bin
  mkdir -p "${pkgdir}"/usr/share/here-and-there-along-the-echo
  mkdir -p "${pkgdir}"/usr/share/{applications,icons}
  
  cp "${srcdir}"/HereAndThereAlongTheEcho/* "${pkgdir}"/usr/share/here-and-there-along-the-echo -R
  
  if [ "${CARCH}" = "x86_64" ]; then
    install -m755 "${srcdir}"/HereAndThereAlongTheEcho/HereAndThereAlongTheEcho.x86_64 "${pkgdir}"/usr/share/here-and-there-along-the-echo/HereAndThereAlongTheEcho
  else
    install -m755 "${srcdir}"/HereAndThereAlongTheEcho/HereAndThereAlongTheEcho.x86 "${pkgdir}"/usr/share/here-and-there-along-the-echo/HereAndThereAlongTheEcho
  fi
  
  find "${pkgdir}/usr/share/here-and-there-along-the-echo" -type d -exec chmod 755 "{}" \;
  find "${pkgdir}/usr/share/here-and-there-along-the-echo" -type f -exec chmod 644 "{}" \;
  
  install -m644 "${srcdir}"/here-and-there-along-the-echo.png "${pkgdir}"/usr/share/icons
  install -m644 "${srcdir}"/here-and-there-along-the-echo.desktop "${pkgdir}"/usr/share/applications
  
  chmod +x "${pkgdir}"/usr/share/here-and-there-along-the-echo/HereAndThereAlongTheEcho
  
  ln -s /usr/share/here-and-there-along-the-echo/HereAndThereAlongTheEcho "${pkgdir}"/usr/bin/here-and-there-along-the-echo
}
