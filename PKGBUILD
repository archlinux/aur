# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>

# Taken from matlab

_pkgname=matlab
pkgname="${_pkgname}-dummy"
pkgver=9.2.0.556344
pkgrel=1
_pkgdesc='A high-level language for numerical computation and visualization'
pkgdesc="${_pkgdesc}, dummy package"
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
makedepends=('gendesk')
depends=('gconf'
         'glu'
         'gstreamer0.10-base'
         'gtk2'
         'libunwind'
         'libxp'
         'libxpm'
         'libxtst'
         'ncurses5-compat-libs'
         'nss'
         'gcc5'
         'portaudio'
         'python2'
         'qt5-svg'
         'qt5-webkit'
         'qt5-websockets'
         'qt5-x11extras'
         'xerces-c')
optdepends=('gcc49: For MEX support')
install="${pkgname}.install"

prepare() {

  msg2 'Creating desktop file'
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --categories "Development;Education;Science;Mathematics;IDE" > /dev/null
  sed -i "/^Exec=/ s,$, -desktop," "${srcdir}/${_pkgname}.desktop"
}

package() {

  msg2 'Creating links for executables'
  install -d -m755 "${pkgdir}/usr/bin/"
  for _executable in deploytool matlab mbuild mcc mex; do
    ln -s "/opt/${_pkgname}/bin/${_executable}" "${pkgdir}/usr/bin/${_executable}"
  done

  msg2 'Installing desktop files'
  install -D -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "/opt/${_pkgname}/help/matlab/matlab_env/matlab_desktop_icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
}
