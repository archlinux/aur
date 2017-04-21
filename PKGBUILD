# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Swen Simon <swsimon at gmail dot com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gmail.com>
pkgname=bin32-epsxe
_pkgname=ePSXe
pkgver=2.0.5
pkgrel=3
pkgdesc="Enhanced PSX emulator (32-bit)"
url="http://epsxe.com"
arch=('i686' 'x86_64')
depends_i686+=(gtk3 sdl_ttf lib32-libtinfo libcurl-compat)
#depends=(gtk3 sdl_ttf libtinfo libcurl-compat)
depends_x86_64=(lib32-gtk3 lib32-libxt lib32-sdl_ttf lib32-libtinfo lib32-libcurl-compat lib32-libcanberra-gtk3)
license=('unknown')
install=${pkgname}.install
options=(!strip)
source=(${pkgname}.desktop ${pkgname}.png ${pkgname}.sh)
md5sums=('aeb34e2ca34f968630ca133ea821c61c'
         'eb0c46b8ae1355c589792f6be1835e47'
         '4684dd9aac162fcf09494a0414705318')
source+=("http://www.epsxe.com/files/ePSXe${pkgver//./}linux.zip")
md5sums+=('3e1976822eb260722b31c9f24cb1d6e1')

package()
{
  binary="${_pkgname}"
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/{share/doc/"${pkgname}",lib}

  find docs -name 'e???e_*.txt' -execdir install -m 644 -t ${pkgdir}/usr/share/doc/${pkgname} \{\} +
  #  find . -name '*.cht' -execdir "install -Dm 644 -t \${pkgdir}/opt/${pkgname}/${pkgver}/cheats\"" \{\} +


  install -Dm 755 "${binary}" "${pkgdir}/opt/${pkgname}/${pkgname}"
#  install -Dm 644 keycodes.lst "${pkgdir}/opt/${pkgname}/keycodes.lst"

  cd "${srcdir}"
  install -Dm 755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 "${srcdir}/$pkgname.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm 644 "${srcdir}/$pkgname.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  ln -sf "$HOME/.${pkgname}rc" -T "${pkgdir}/opt/${pkgname}/.${pkgname}rc"

  # libtinfo and ncurses crap
  ln -s /usr/lib32/libncursesw.so.6 "$pkgdir"/opt/"$pkgname"/libncurses.so.5
  ln -s /usr/lib32/libtinfo.so.6 "$pkgdir"/opt/"$pkgname"/libtinfo.so.5
}
