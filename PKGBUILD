# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# shellcheck disable=SC2034,SC2154

pkgname=orcaqm
pkgver=6.1.0
_openmpi_ver=4.1.8
pkgrel=1
pkgdesc="Ab initio, DFT, and semi-empirical SCF-MO package"
url="https://www.faccts.de/orca/"
license=(custom:orca)
arch=(x86_64)
depends=(openmpi)
makedepends=(xz)
# Due to licensing issues you must register and download the package from the ORCA url and put it in the PKGBUILD folder!
source=("local://orca_${pkgver//./_}_linux_x86-64_shared_openmpi${_openmpi_ver//./}.tar.xz"
        "orcaqm")
noextract=("orca_${pkgver//./_}_linux_x86-64_shared_openmpi${_openmpi_ver//./}.tar.xz")
b2sums=('9434ae80e628e6e153d5aaf50da987c5e088b1c4540a4a441cfe7564ae5b6796b6ba9cd2e7634768f6cdd6bb2f938a7d8ee7e781c6321522f34028b32fa3311b'
        'e580e58eb075e56ee69a9ad20010237f2158b0c92e5eb94d7ea60f3e60677062db64926f42da3cb52652d4515de81fa83ecc150918a17bb4615b20d66c24f23c')
options=(staticlibs !strip)

package() {
  # create necessary directories
  mkdir -p "${pkgdir}"/opt/orca

  # install stuff in place
  tar -xJf "${srcdir}"/orca_${pkgver//./_}_linux_x86-64_shared_openmpi${_openmpi_ver//./}.tar.xz --strip 1 -C "${pkgdir}"/opt/orca
  install -Dm755 "${srcdir}"/orcaqm "${pkgdir}"/usr/bin/orcaqm

  # install licenses
  install -Dm644 "${pkgdir}"/opt/orca/orca/EULA_ORCA_2025.pdf "${pkgdir}/usr/share/licenses/${pkgname}/EULA_ORCA_2025.pdf"
  install -Dm644 "${pkgdir}"/opt/orca/orca/Third_Party_Licenses_Academic_6.1.pdf "${pkgdir}/usr/share/licenses/${pkgname}/Third_Party_Licenses_Academic_6.1.pdf"
}
