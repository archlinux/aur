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
pkgver=1.3.0
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
sha256sums_aarch64=('b88a72d7a610e85a8b732e21bdb0257638e4428af2f8b9eeb0a249785db214e6'
                    'fa4ecbb5c79be29fbaaeee84822f69318f3e08e9b3151f300d8457daa0f62439')
sha256sums_armv7h=('1ce346df7ffd4fb5f516fe6c37a6c21cf29fcd92222d3bedec78a10bb788f0f6'
                   '219ba350690574ef5cde1c8a8ff99a27703782825c7310e69debd468a7baf136')
sha256sums_i686=('0fc0cd4dda120ee557e60f7eb0b74e5a08a2e78a2ddaaffba98c0b8ba7dadc28'
                 '7d1fcdf3f744c173c0885275ab0e42ccae2bfe3b76d6ab79f9d822c9aca7f36e')
sha256sums_x86_64=('1167093863ce7458e37ab962439a5c6769f915af646e7bfc73c6e5f79032f2c4'
                   'c64fb9616f889b6a119fe1fc6ec77e76145f5881c694818571f39dac4588933a')

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
