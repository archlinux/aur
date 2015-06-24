# Maintainer: Duru Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=0xdbe-eap
_pkgname=0xdbe
pkgver=142.2675.6
_buildver=142.2675.6
pkgrel=1
pkgdesc='Smart SQL Editor and Advanced Database Client Packed Together for Optimum Productivity'
arch=('i686' 'x86_64') # not 'any' because of fsnotifier
url="http://www.jetbrains.com/dbe/"
backup=("usr/share/${_pkgname}/bin/${_pkgname}.vmoptions" "usr/share/${_pkgname}/bin/${_pkgname}64.vmoptions")
license=('Commercial')
depends=('java-environment' 'giflib')
source=("http://download.jetbrains.com/dbe/${_pkgname}-${_buildver}.tar.gz" \
        "${_pkgname}.sh" \
        "${_pkgname}.desktop")
md5sums=('4d45c8133cea079d059c3ca48b87e4a8'
         '864c5bb6071568a1a9f26573e090207b'
         'e520ed91c5c0578cc93df0cd7e03166b')
package() {
  cd "${srcdir}"

  install -d -m755 $pkgdir/usr/{bin,share}
  cp -a "0xDBE-${_buildver}" "${pkgdir}/usr/share/${_pkgname}"
  chown -R root:root "${pkgdir}/usr/share"
  find "$pkgdir/usr/share/$_pkgname" -type d -exec chmod 0755 {} ';'
  find "$pkgdir/usr/share/$_pkgname" -type f -exec chmod 0644 {} ';'

  # never wait on user input when starting idea; copied from -ce PKGBUILD
  sed -i '/.*read IGNORE.*/ d' "${pkgdir}"/usr/share/$_pkgname/bin/${_pkgname}.sh

  chmod +x "$pkgdir"/usr/share/$_pkgname/bin/${_pkgname}.sh
  chmod +x "$pkgdir"/usr/share/$_pkgname/bin/fsnotifier
  chmod +x "$pkgdir"/usr/share/$_pkgname/bin/fsnotifier64

  install -D -m755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D -m644 "$srcdir/0xDBE-$_buildver/bin/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
  install -D -m644 "$srcdir/0xDBE-$_buildver/license/0xDBE_Preview_license.txt" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
