# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='gog-hollow-knight'
pkgver=1.5.12459.88536
pkgrel=1
# Fix upstream versioning shenanigans:
epoch=1
pkgdesc="Challenging 2D side-scrolling Metroidvania soulslike game"
url='http://hollowknight.com/'
license=('custom')
arch=('x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "hollow_knight_${pkgver//./_}.sh::gogdownloader://hollow_knight/en3installer0"
)
sha256sums=('987b0c0e32895d0a4214650d0afb2f3c2359b049212e13860dc9ae67553c48b4'
            '8860a0daf52181f78711c2b1099d7a09a30ba09331c68e8aae71182a996a0acd'
            '0d101b033c08305fbeded72d69fbe9dc74b3960e04345799af1963de5be9dc8e')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

prepare() {
  find . -type d -exec chmod 755 {} \;
}

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  mv \
    "${srcdir}/data/noarch/game" \
    -t "${pkgdir}/opt/${pkgname}/"

  install -D -m 755 -T \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 755 \
    "${srcdir}/data/noarch/start.sh" \
    -t "${pkgdir}/opt/${pkgname}/"
  install -D -m 755 \
    "${srcdir}"/data/noarch/support/*.{sh,shlib} \
    -t "${pkgdir}/opt/${pkgname}/support/"
  install -D -m 644 \
    "${srcdir}/data/noarch/gameinfo" \
    -t "${pkgdir}/opt/${pkgname}/"

  install -D -m 644 -T \
    "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m 644 -T \
    "${srcdir}/data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m 644 -T \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

