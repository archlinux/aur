# Maintainer: Julius Freudenberger <contact@jfreudenberger.de>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='usbimager'
pkgname="${_pkgname}-bin"
pkgver=1.0.10
pkgrel=1
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

sha256sums=('7b31dd099aa020f3a0d8adb062953c6257cb1aa85de2909f4029bc867ab64532'
            '6fcb3449da17f96893b74d52bc248fd11fd0d6b0731c9f5d8e2065bbe2685e0b')
sha256sums_x86_64=('4d6cf77889e3fa40da0d764c218b819084110217a606c38d36e414aa153a7da1')
sha256sums_armv7h=('a76e7d40662917f2e967ac56f265e4d8e6af0c6a889409a0724f1d2ffd78c7cf')
sha256sums_aarch64=('a76e7d40662917f2e967ac56f265e4d8e6af0c6a889409a0724f1d2ffd78c7cf')

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
