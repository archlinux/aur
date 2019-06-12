# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=lmgrd
pkgver=11.16.2.1
pkgrel=1
pkgdesc='FLEXnet License Manager (lmgrd) for MATLAB'
arch=('x86_64')
url=https://www.mathworks.com/support/install/license_manager_files.html
license=(custom)
depends=(ld-lsb gcc-libs)
makedepends=(unzip)
conflicts=(autodesk-nlm flexnet)
source=(
    "${pkgname}-${pkgver}.zip::http://ssd.mathworks.com/supportfiles/downloads/R2019a/license_manager/R2019a/daemons/glnxa64/mathworks_network_license_manager_glnxa64.zip"
    "lmgrd.service"
)
sha512sums=('a2b072e7bca0bcb3b7e424edf0bf9fd87fd22b16a347d072530165f7eb119c1d54f3e498d5fbfa8372ac2c674d2e66f8ff16754b606f847e94a54723477356ff'
            '639f4c2b1640ceb243cf1fdbc4a60ed8e472d0d30c51e09e56c645e7ced9d4e0ef5693504df143b79802658cf50978056109804dd780bfeaca04477e4735ccd3')
install="${pkgname}.install"
noextract=("${pkgname}-${pkgver}.zip")

package() {
  install -d "${pkgdir}/opt/lmgrd" "${pkgdir}/usr/bin" "${pkgdir}/etc/lmgrd/licenses"
  unzip -d "${pkgdir}/opt/lmgrd" -x "${srcdir}/${pkgname}-${pkgver}.zip"
  ln -s "/opt/lmgrd/etc/glnxa64/lmgrd" "${pkgdir}/usr/bin/lmgrd"
  ln -s "/opt/lmgrd/etc/glnxa64/lmutil" "${pkgdir}/usr/bin/lmutil"
  ln -s "/opt/lmgrd/etc/glnxa64/MLM" "${pkgdir}/usr/bin/MLM"
  # ArchLinux uses /tmp instead of /usr/tmp
  ln -s "/tmp" "${pkgdir}/usr/tmp"
  install -Dm644 lmgrd.service -t "${pkgdir}/usr/lib/systemd/system"
}
# vim:set ts=2 sw=2 et:
