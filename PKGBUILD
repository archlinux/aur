# Maintainer: cars10t <carsten.1 gmx.net>

pkgname=sqrxz
pkgver=0.996a
pkgrel=1
pkgdesc="A fast paced jump'n'run which will please the hardcore gamer amongst you."
arch=('i686' 'x86_64')
url="http://sqrxz.de/"
license=('Freeware')
depends=('sdl_mixer' 'zlib')
source=("http://www.retroguru.com/${pkgname}/${pkgname}-v${pkgver//./}-ubuntu.tar.gz"
        "${pkgname}.png"
        "${pkgname}.sh"
        "${pkgname}.desktop")
md5sums=('c1aeca939aa91547391127c66fcf945a'
         'd10c83b355d87098251b076fe98a70e0'
         'e8ea0bad8846ca29172d18ecbe1481d2'
         'fd4c648b20629430dfcb84261115c2ab')
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
