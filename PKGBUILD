# Maintainer: Primalmotion <primalmation at pm dot me>

_pkgname=librem-ec-acpi-dkms
pkgname="${_pkgname}-git"
pkgver=0.9.2
pkgrel=1
pkgdesc='Librem 14 EC APCI Driver from primalmotion fork'
arch=('any')
url='https://source.puri.sm/primalmotion/librem-ec-acpi-dkms'
license=('GPL')
depends=('dkms' 'linux-headers')
source=("git+https://source.puri.sm/primalmotion/librem-ec-acpi-dkms#branch=fix-kernel-6.15")

sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -i "s/#MODULE_VERSION#/${pkgver}/" debian/librem-ec-acpi-dkms.dkms
}

package() {
  local _srcdir="${srcdir}/${_pkgname}"
  local install_dir="${pkgdir}/usr/src/${_pkgname}"
  install -Dm644 "${_srcdir}/debian/librem-ec-acpi-dkms.dkms" "${install_dir}/dkms.conf"
  cd "${_srcdir}"
  for d in $(find . -type d);do install -dm755 "${install_dir}/$d";done
  for f in $(find . -type f);do install -m644 "$f" "${install_dir}/$f";done
}
