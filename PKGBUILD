# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="interactsh"
_pkgname=(
  "${_pkgbase}-common"
  "${_pkgbase}-client"
  "${_pkgbase}-server"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=1.3.1
pkgrel=1
pkgdesc="OOB interaction gathering server and client library"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/projectdiscovery/${_pkgbase}"
license=(
  'MIT'
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgbase}-client_${pkgver}_linux_arm64.zip"
  "${url}/releases/download/v${pkgver}/${_pkgbase}-server_${pkgver}_linux_arm64.zip"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgbase}-client_${pkgver}_linux_arm.zip"
  "${url}/releases/download/v${pkgver}/${_pkgbase}-server_${pkgver}_linux_arm.zip"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgbase}-client_${pkgver}_linux_386.zip"
  "${url}/releases/download/v${pkgver}/${_pkgbase}-server_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgbase}-client_${pkgver}_linux_amd64.zip"
  "${url}/releases/download/v${pkgver}/${_pkgbase}-server_${pkgver}_linux_amd64.zip"  
)
sha256sums_aarch64=('475aa78c59afad115149a5b0d6d9c99d2410a4f12d0c6f5a24c32e7338fc6adb'
                    'ddd73fc2bc4a526705b442001f88832da328c18e8b6e6480f8784552b5b934bd')
sha256sums_armv7h=('5d1ec9c4c2b1cf4f2c9ec9f19d3ed5933a3934dfbbc6622582ca6ae69990d736'
                   '48c42b417f762b6e9602a28efaa60077ee5c22e205d1d2bbb1606ecfe542cefe')
sha256sums_i686=('bc6d0e1dc9201886cb0393e9c30bc414babe73a3b18606f996d4dd69fbb34d1c'
                 '057ddbad8a8e2960877059759366844e99b90c8ef36afc9bbb65e8a2ac898443')
sha256sums_x86_64=('d553fb3dd4c2684c953aedeb555f13f0d1ca94bd75112c949a5fd975d385a903'
                   'cb59d094df7e8d9ecb0b8d368551e0e9af6ab555dbfc0655e8f9e4b56ec5cb19')

package_interactsh-common-bin() {
  pkgdesc+=" (common files)"
  arch=(
    'any'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.md"
}

package_interactsh-client-bin() {
  pkgdesc+=" (client)"
  depends+=(
    "${_pkgbase}-common>=${pkgver}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_interactsh-server-bin() {
  pkgdesc+=" (server)"
  depends+=(
    "${_pkgbase}-common>=${pkgver}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
