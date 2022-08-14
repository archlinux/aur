# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname='gog-a-short-hike'
pkgver=1.9.v3.51666
pkgrel=1
pkgdesc="Hike, climb, and soar through the peaceful mountainside landscapes of Hawk Peak Provincial Park."
url='http://ashorthike.com/'
license=('custom')
arch=('x86_64')
depends=('libxml2' 'zlib')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "a_short_hike_${pkgver//./_}.sh::gogdownloader://a_short_hike/en3installer0"
)
sha256sums=('50a0a69e8dfc3120896e3291b56224f208db80d832e5e497bfb39d8de9b15099'
            '2b81ba692e940f059bd52c460c5d7e92bf236a00e99cb81fa8afb29af3e77b6a'
            '2f2c82a481636b587a211ace7f5c92f523cd88f2a05ba3dbfdac848d3f622266')

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

