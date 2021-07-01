# Maintainer: Primalmotion <primalmation at pm dot me>

_pkgname=librem-ec-acpi
pkgname="${_pkgname}-dkms"
pkgver=0.9.1
pkgrel=1
pkgdesc='Librem 14 EC APCI Driver'
arch=('any')
url='https://source.puri.sm/nicole.faerber/librem-ec-acpi-dkms'
license=('GPL')
depends=('dkms')
source=("https://source.puri.sm/nicole.faerber/librem-ec-acpi-dkms/-/archive/v0.9.1/librem-ec-acpi-dkms-v0.9.1.tar.gz")

sha256sums=('df6aa990d50962805b61ca227619890f57676d3dcd88be6b7fffd3664d8ceee8')

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

