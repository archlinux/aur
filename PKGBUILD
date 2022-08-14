# Maintainer: Joonas Henriksson <joonas.henriksson at gmail com>

pkgname=gog-devil-daggers
pkgver=3.2.51024
pkgrel=1
pkgdesc='Fast-paced shooter that places you in an abyssal arena to face endless legions of progressively more dreadful demons.'
url='http://devildaggers.com/'
license=('custom')
depends=('openal' 'libx11' 'openssl' 'zlib' 'libGL.so')
arch=('x86_64')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  "devil_daggers_v${pkgver//./_}.sh::gogdownloader://devil_daggers/en3installer0"
)
sha256sums=('ddbdb9c7b941dee9b6222a2e015889b51d1a96e23afd52b9440cbf8303ab8a4e'
            'f1674902db66bac81eb75951140b180ca85bac314699e1185231f0a66936821d'
            '649374f2c0dd65b1c66ae0d4ffb2bea9f7ba9f95ab6df05bc9b8bea03823a69f')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

prepare() {
  find . -type d -exec chmod 755 {} \;
}

package() {
  chmod +x "${srcdir}/data/noarch/game/devildaggers"
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

