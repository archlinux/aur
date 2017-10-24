#
# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gmail.com>
#

# XXX maybe bin32 should be combined with this and we should use pkgbase?
pkgname=epsxe
_pkgname=ePSXe
pkgver=2.0.5
pkgrel=22
pkgdesc="Enhanced PSX emulator (64-bit)"
url="http://epsxe.com"
arch=('x86_64')
depends=(gtk3
         libxt
         sdl_ttf
         libcurl-compat
         libcanberra
         bash
         'ncurses>=6.0+20170902-2'
         openssl-1.0
        )
license=('unknown')
install=${pkgname}.install
options=(!strip)
source=(${pkgname}.desktop
        ${pkgname}.png
        ${pkgname}.sh
        "http://www.epsxe.com/files/${_pkgname}${pkgver//./}linux_x64.zip"
       )
md5sums=('aeb34e2ca34f968630ca133ea821c61c'
         'eb0c46b8ae1355c589792f6be1835e47'
         '8d47875ba4f51943cdb6e09c2f25e4b5'
         '79fefeb4bff26bf1d374befb35b390df'
        )

package()
{
 _binary="${pkgname}_x64"

  cd "${srcdir}"
  install -d "${pkgdir}"/usr/{share/doc/"${pkgname}",lib}

  find docs -name 'e???e_*.txt' -execdir install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \{\} +

  install -Dm 755 "${_binary}" "${pkgdir}/opt/${pkgname}/${pkgname}"

  cd "${srcdir}"
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/epsxe.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${srcdir}/epsxe.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  ln -sf "$HOME/.${pkgname}rc" -T "${pkgdir}/opt/${pkgname}/.${pkgname}rc"
}
