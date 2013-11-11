# Maintainer: cars10t <carsten.1 gmx.net>

pkgname=sqrxz2
pkgver=0.80
pkgrel=1
pkgdesc="A fast paced jump'n'run which will please the hardcore gamer amongst you."
arch=('i686' 'x86_64')
url="http://sqrxz.de/"
license=('Freeware')
depends=('sdl_mixer' 'zlib')
source=("http://www.retroguru.com/${pkgname}/${pkgname}-v${pkgver}-ubuntu.zip"
        "${pkgname}.png"
        "${pkgname}.sh"
        "${pkgname}.desktop")
md5sums=('fadc7b02c01b6726e8b7a3a92cc9d578'
         'd10c83b355d87098251b076fe98a70e0'
         '6ccbb96f4adde66cbefb04d3c947af1f'
         'fcc03a661f0d02a00bb0d85b7c13575a')
options=(!strip)
install=${pkgname}.install

package() {
  cd "${srcdir}/"

  # use correct arch
  case ${CARCH} in
    i686)
      cp ${pkgname}_ubuntu32 $pkgname
      ;;
    x86_64)
      cp ${pkgname}_ubuntu64 $pkgname
      ;;
  esac

  # install binary, data, text, icon and desktop files
  install -Dm755 "${pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}"
  install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

  mkdir -p "${pkgdir}/opt/${pkgname}/data"
  install -Dm644 data/*.zda "${pkgdir}/opt/${pkgname}/data"

  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 *.txt "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # fix permissions
  chgrp -R games ${pkgdir}/opt/${pkgname}
  chmod g+w ${pkgdir}/opt/${pkgname}
}
