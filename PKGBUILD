# Contributor: Rafael Silva <perigoso@riseup.net>
# Contributor: Dan Beste <drb@wishalloy.io>
# Contributor: Alastair Hughes

pkgname='gog-stardew-valley'
pkgver=1.6.2
pkgrel=1
# Fix upstream versioning shenanigans:
epoch=1
pkgdesc="You’ve inherited your grandfather’s old farm plot in Stardew Valley.
Armed with hand-me-down tools and a few coins, you set out to begin your new
life."
url='http://stardewvalley.net/'
license=('custom')
arch=('x86_64')
depends=('openssl-1.1')
options=('!strip' 'staticlibs')
source=(
  "${pkgname}"
  "${pkgname}.desktop"
  'local:///stardew_valley_1_6_2_24081_6443062877_72053.sh'
)
sha256sums=('9f51b56b351824493c381731f29175b0897fa0dc4169a9b9160b5a12003883dc'
            'ca0fe151f73f5e8b594b226e1b0539655a2d95a7848eb0e43961cb6daa0de2ff'
            '4f3c91d3e5d2d67bffd38b207165463d4925174cc6b84b15497098092f621d8f')


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
