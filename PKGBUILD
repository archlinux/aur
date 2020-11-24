# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='usbimager'
pkgname="${_pkgname}-bin"
pkgver=1.0.5
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

sha256sums=('559b8756de54a971c097b05ecfcba12a87f520193b58e52d52c26e370b4da8a0'
            '6fcb3449da17f96893b74d52bc248fd11fd0d6b0731c9f5d8e2065bbe2685e0b')
sha256sums_x86_64=('36ccfa7942aeba4486cb3234e25ce04154fafbde619195926dd1dec97442d31d')
sha256sums_armv7h=('08c363a6fb314babe874ac5ce9d31d6404d62c6769a06693b4c364a93443fafe')
sha256sums_aarch64=('08c363a6fb314babe874ac5ce9d31d6404d62c6769a06693b4c364a93443fafe')

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
