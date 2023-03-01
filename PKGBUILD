# Maintainer: Primalmotion <primalmation at pm dot me>

_pkgname=librem-ec-acpi
pkgname="${_pkgname}-dkms"
pkgver=0.9.2
pkgrel=1
pkgdesc='Librem 14 EC APCI Driver'
arch=('any')
url='https://source.puri.sm/nicole.faerber/librem-ec-acpi-dkms'
license=('GPL')
depends=('dkms')
source=("https://source.puri.sm/nicole.faerber/librem-ec-acpi-dkms/-/archive/v${pkgver}/librem-ec-acpi-dkms-v${pkgver}.tar.gz")

sha256sums=('f238547e170d6b8a56ca724b71ca0719bee19dd14257079f463444d32b42c0a2')

prepare() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" debian/librem-ec-acpi-dkms.dkms
}

package() {
  local _srcdir="${srcdir}/${pkgname}-v${pkgver}"
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  install -Dm644 "${_srcdir}/debian/librem-ec-acpi-dkms.dkms" "${install_dir}/dkms.conf"
  cd "${_srcdir}"
  for d in $(find . -type d);do install -dm755 "${install_dir}/$d";done
  for f in $(find . -type f);do install -m644 "$f" "${install_dir}/$f";done
}
