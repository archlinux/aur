# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname='gog-race-the-sun'
pkgver=2.4.0.8
pkgrel=1
pkgdesc="You are a solar powered craft, racing against the sunset at insane speeds through an infinite procedural world that changes every day."
url='http://flippfly.com/racethesun/'
license=('custom')
arch=('x86_64' 'i686')
depends=('zlib' 'libGL.so')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "gog_race_the_sun_${pkgver}.sh::gogdownloader://race_the_sun/en3installer3"
)
sha256sums=('4b48b6cf2df63532d7ac597d54e235d1484792067190bcea74d19158db193e71'
            '6019acb30ae95360ae7560f4b075a02375c9543ef85baf4afab7b11f489c69b3'
            '52735beb981d7853e8f40129f8d481eff454a31daf327f462e068b8e03ee1b27')

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

