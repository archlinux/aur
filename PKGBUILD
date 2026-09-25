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
pkgver=1.4.0
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
sha256sums_aarch64=('89a72e2dedaa47a6d790f575169d115e8dc31f243eeaf1ce066d7dfe1ee283ef'
                    '143bc534901a8265ca31f5c350a2af59e81a506a2b7d878807aefde67893dac2')
sha256sums_armv7h=('0129d25e4104a7c331bb9dedf2e89f6f7b4200ba5f14bee4af7535fa275f806d'
                   '554c416546ca4a0bad2b695e9798b26312fb323f7cfb2ed5805b4790f275b5bd')
sha256sums_i686=('001ee1cd9f1c5a751c5e1ce733104af6a4b2ff13a5f83e734d932b5793e75837'
                 '04255ae959f7f97ab47b62d1167e46803bddff8343920c08ee5ba100dc4201ef')
sha256sums_x86_64=('86b8145da8196a22e966d36ede3bdad14f8af89ac06b1fcfbf82605296e2a289'
                   'daca1002378d3c53c7c9e6ea3a195f6c8d58e7d6e25d800faa1b439955b8f519')

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
  install -vDm644 "README.md"  -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgbase}"
}

package_interactsh-client-bin() {
  pkgdesc+=" (client)"
  depends+=(
    "${_pkgbase}-common-bin>=${pkgver}"
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
    "${_pkgbase}-common-bin>=${pkgver}"
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
