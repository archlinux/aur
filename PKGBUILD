# Maintainer: Ash <xash at riseup d0t net>
# Contributor: envolution
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|prebuild=_sourcefix.sh| https://github.com/envolution/aur/blob/main/maintain/build/chromium-widevine/_sourcefix.sh

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=4.10.3050.0
_release_id=bywu6vkyg6gmcthxdaetzfkptm
_file_id=aduyhcxcs7a2znuo6ss5tffn5jpa
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
options=('!strip')
source=("https://www.google.com/dl/release2/chrome_component/${_release_id}_${pkgver}/oimompecagnajdejgnnjijobebaeigek_${pkgver}_linux_${_file_id}.crx3")
sha256sums=('b70d887771d663018f46b1072b14320bd8b9a763641ef0317bd979cbad443e88')

package() {
  depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')

  install -Dm755 "${srcdir}/_platform_specific/linux_x64/libwidevinecdm.so" \
    "${pkgdir}/usr/lib/chromium/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so"
  install -Dm644 "${srcdir}/manifest.json" \
    "${pkgdir}/usr/lib/chromium/WidevineCdm/manifest.json"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/lib/chromium/WidevineCdm/LICENSE"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # backward compatibility
  ln -s WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so "$pkgdir/usr/lib/chromium/libwidevinecdm.so"
}
# vim:set ts=2 sw=2 et:
