# Maintainer: Sick Codes <info at sick dot codes>
pkgname=momentics-bin
_pkgname=${pkgname%-bin}
pkgver=2.1.2
pkgrel=201503050937
pkgdesc="Native SDK for BlackBerry 10 & Momentics IDE - qde"
arch=('x86_64' 'x86')
url="https://developer.blackberry.com/native/downloads"
license=('custom:BLACKBERRY SDK')
provides=(${_pkgname} qde)
depends=()
optdepends=()
makedepends=()
source=("${url}/fetch/${_pkgname}-${pkgver}-${pkgrel}.linux.${CARCH}.run")
options=('!strip')
sha256sums=('SKIP')

package() {
  install -dm755 ${pkgdir}/opt/
  install -dm755 ${pkgdir}/usr/bin/
  
  _executable=$(basename "${source[0]}")

  cd "${srcdir}"
  chmod +x "${_executable}"

  sed -i -e 's/^MS_PrintLicense$/\#MS_PrintLicense/' "./${_executable}"

  yes | "./${_executable}" --keep --confirm --nox11 --target "${pkgdir}/opt/${_pkgname}"

  ln -s "${pkgdir}/opt/${_pkgname}/qde" "${pkgdir}/usr/bin/qde"

  echo "momentics is located at /opt/momentics"
  echo "start momentics using /usr/bin/qde"

}
