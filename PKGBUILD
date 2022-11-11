# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='usbimager'
pkgname="${_pkgname}-bin"
pkgver=1.0.8
pkgrel=3
pkgdesc='Minimal GUI application to write compressed disk images to USB drives (GTK+ Frontend)'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://gitlab.com/bztsrc/usbimager'
license=('MIT')
depends=('gtk3' 'udisks2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# https://gitlab.com/bztsrc/usbimager/tree/binaries
source=("${_pkgname}-${pkgver}-manual::${url}/-/raw/${pkgver}/usbimager-manual.pdf"
        "${_pkgname}-${pkgver}-license::${url}/-/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64.zip::${url}/-/raw/binaries/${_pkgname}_${pkgver}-x86_64-linux-gtk.zip")
source_armv7h=("${_pkgname}-${pkgver}-armv7h.deb::${url}/-/raw/binaries/${_pkgname}_${pkgver}-armhf.deb")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::${url}/-/raw/binaries/${_pkgname}_${pkgver}-armhf.deb")

sha256sums=('8bc3fefad7ed60af740cade94aba20803865cf648e693f826b889742126a15c3'
            '6fcb3449da17f96893b74d52bc248fd11fd0d6b0731c9f5d8e2065bbe2685e0b')
sha256sums_x86_64=('f5a92343a7caba0c003c9335f2a2a1842751efb333dce87940762fedcadadce0')
sha256sums_armv7h=('bbed8e9d93fa5e7896a7b77f0f0a247af6094a88dd9f51c1241aa4d2cafebbb1')
sha256sums_aarch64=('bbed8e9d93fa5e7896a7b77f0f0a247af6094a88dd9f51c1241aa4d2cafebbb1')

package() {
  install -Dvm644 "${_pkgname}-${pkgver}-manual" "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}-manual.pdf"
  install -Dvm644 "${_pkgname}-${pkgver}-license" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  if [ "${CARCH}" == 'armv7h' ] || [ "${CARCH}" == 'aarch64' ]; then
    tar -xvf 'data.tar.gz' && cd 'usr'
  fi
  install -Dvm755 "bin/${_pkgname}" -t "${pkgdir}/usr/bin"
  cp -rfv 'share' "${pkgdir}/usr"
}

# vim: ts=2 sw=2 et:
