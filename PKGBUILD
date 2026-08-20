# Maintainer: Stewart <goodmans at protonmail dot com>
# Thanks to maintainers of gog-stardew-valley which this PKGBUILD is copied from.

pkgname='gog-mount-and-blade-warband'
pkgver=2.068
pkgrel=1
pkgdesc="Sandbox role-playing game that takes place in the medieval land of Calradia"
url='https://www.taleworlds.com/en/games/warband'
license=('custom')
arch=('x86_64')
depends=('libcurl-gnutls')
options=('!strip' 'staticlibs')
source=("${pkgname}"
        "${pkgname}.desktop"
        'mount_blade_warband_vc_2_068_72059.sh::gogdownloader://mount_blade_warband/en3installer0')
# If you want to use lgogdownloader add the following to /etc/makepkg.conf
# DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')
DLAGENTS+=("gogdownloader::/usr/bin/awk BEGIN{print\\ \"Could\\ not\\ find\\ gog\\ installer\\ file\\ (%u).\\ Manually\\ download\\ it\\ to\\ \\\\\"\\$(pwd | sed 's/ /\\ /g')\\\\\",\\ or\\ set\\ up\\ a\\ gogdownloader://\\ DLAGENT\\ in\\ /etc/makepkg.conf.\\ See\\ PKGBUILD\\ for\\ example.\";\\ exit\\ 1}")
sha256sums=('72f1d895646077f320913494c5f3293d8a9712dfe18f8ad5b32a7c73323278cd'
            '5d969c3a931f14eabc4b31905d3d161c110ee388d2a8d29c2df54f69190822e7'
            '57a681331b20933310d21d22dfa8c60d4ec4252a74d718c2e5760eac85a6c088')

package() {
  install -d "${pkgdir}/opt/${pkgname}/"
  install -d "${pkgdir}/opt/${pkgname}/support/yad/64"
  install -d "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/applications/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -d "${pkgdir}/usr/share/pixmaps/"

  cp -r data/noarch/game "${pkgdir}/opt/${pkgname}/"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;

  install -m 755           \
    "${srcdir}/${pkgname}" \
    "${pkgdir}/usr/bin/${pkgname}"
  install -m 755         \
    data/noarch/start.sh \
    "${pkgdir}/opt/${pkgname}/"
  install -m 755                     \
    data/noarch/support/*.{sh,shlib} \
    "${pkgdir}/opt/${pkgname}/support/"
  install -m 755                     \
    'data/noarch/support/yad/yad.sh' \
    "${pkgdir}/opt/${pkgname}/support/yad/"
  install -m 755                     \
    'data/noarch/support/yad/64/yad' \
    "${pkgdir}/opt/${pkgname}/support/yad/64/"
  install -m 644                                      \
    'data/noarch/docs/End User License Agreement.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -m 644                   \
    "data/noarch/support/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -m 644                   \
    "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim: ts=2 sw=2 et:
