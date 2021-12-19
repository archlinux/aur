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

  _executable=$(basename "${source[0]}")
  _opt_folder=bbndk

  install -dm755 "${pkgdir}/opt/${_opt_folder}/"
  install -dm755 "${pkgdir}/usr/bin/"  

  cd "${srcdir}"
  chmod +x "${_executable}"

  sed -i -e 's/^MS_PrintLicense$/\#MS_PrintLicense/' "./${_executable}"

  yes | "./${_executable}" --keep --confirm --nox11 --target "${pkgdir}/opt/${_opt_folder}"

  chmod a+x "${pkgdir}/opt/${_opt_folder}/qde"

  ln -s "/opt/${_opt_folder}/qde" "${pkgdir}/usr/bin/qde"
  ln -s "/opt/${_opt_folder}/qde" "${pkgdir}/usr/bin/momentics"

  echo "=== IMPORTANT: run momentics, select Help > Update API Levels ==="
  echo "momentics is located at /opt/${_opt_folder}"
  echo "start momentics using /usr/bin/qde or /usr/bin/momentics"

}
