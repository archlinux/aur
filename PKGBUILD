# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname='gog-a-short-hike'
pkgver=1.10.1.85630
pkgrel=1
pkgdesc="Hike, climb, and soar through the peaceful mountainside landscapes of Hawk Peak Provincial Park."
url='http://ashorthike.com/'
license=('custom')
arch=('x86_64')
depends=('libxml2' 'zlib')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "a_short_hike_1_10_1_patched_${pkgver##*.}.sh::gogdownloader://a_short_hike/en3installer0"
)
sha256sums=('50a0a69e8dfc3120896e3291b56224f208db80d832e5e497bfb39d8de9b15099'
            'e4a58e5a8ee24326ce1eb9e8e1c285a65545dba38d87d62e501ce0cab1198334'
            'a14d295f2f2831e9fdaa85e1843d595ad549233ba89c5cdb349903e74a912894')

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

