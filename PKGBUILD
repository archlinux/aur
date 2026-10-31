# Maintainer: Ash <xash at riseup d0t net>
# Contributor: envolution
# Contributor: Doug Newgard <scimmia at archlinux dot org>
# shellcheck shell=bash disable=SC2034,SC2154
# ci|prebuild=_sourcefix.sh| https://github.com/envolution/aur/blob/main/maintain/build/chromium-widevine/_sourcefix.sh

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=4.10.3112.0
_release_id=acqexsh26ysyu3zxeotqtsp63idq
_file_id=ad7kyx4q7wx7xknykmkbonbbmnwq
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
options=('!strip')
source=("https://www.google.com/dl/release2/chrome_component/${_release_id}_${pkgver}/oimompecagnajdejgnnjijobebaeigek_${pkgver}_linux64_${_file_id}.crx3")
sha256sums=('1bf1f200dcccd461b2d029d000d0fcf800f0571c932db31467b9d5d301e0a98f')

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
