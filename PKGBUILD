# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="interactsh"
_name=("client" "server")
_pkgname=("${_name[@]/#/${_pkgbase}-}")
pkgbase="${_pkgbase}-bin"
pkgname=("${_pkgname[@]/%/-bin}")
pkgver=1.2.4
pkgrel=2
pkgdesc="OOB interaction gathering server and client library"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgbase}"
license=('MIT')
for binary in "${_pkgname[@]}"; do
  source_aarch64+=("${binary}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${binary}_${pkgver}_linux_arm64.zip")
  source_armv7h+=("${binary}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${binary}_${pkgver}_linux_arm.zip")
  source_i686+=("${binary}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/${binary}_${pkgver}_linux_386.zip")
  source_x86_64+=("${binary}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${binary}_${pkgver}_linux_amd64.zip")
done
sha256sums_aarch64=('c5b36d2ddf20c2524cbfc7174e66ef0e2abe9d1ece222917d8b0a5676e55568f'
                    'd867f96bf786a54a1ed090762935e448f54202f3226e058c2fed1014fea15af7')
sha256sums_armv7h=('d5e237643dbdc8ac486081580ce0092996916c7f4059ef816e305a831dd5b1a2'
                   'c263c4f4e2e168bb77e3ff1a191e29d37c9ba03088a9cd3c0263edd51882427f')
sha256sums_i686=('846b544bcfc89fe54c0a8b8a7926c137ae0891d885e1442a9160a733be60851e'
                 '7b5d7e1bd749a5e8d0f4593df2f6635c5c243a1b1d50132a8f7e264b6ff911eb')
sha256sums_x86_64=('d6728561b0db2266d2e301773b2fcf9079f6fe402ebae477bc6e92775cab9a72'
                   'dedc1766422e27c88e190c60662c29503bc9aaa8e364b2bacd510e8558a9fba0')

package_interactsh-client-bin() {
  local binary="${pkgname%-bin}"

  pkgdesc+=" ($(echo "${pkgname}" | cut -d'-' -f2))"
  optdepends=("${_pkgbase}-server: server functionality")
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  cd "${srcdir}"
  install -vDm755 "${binary}"  "${pkgdir}/usr/bin/${binary}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${binary}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${binary}/LICENSE.md"
}

package_interactsh-server-bin() {
  local binary="${pkgname%-bin}"

  pkgdesc+=" ($(echo "${pkgname}" | cut -d'-' -f2))"
  optdepends=("${_pkgbase}-client: client functionality")
  provides=("${pkgname%-bin}")
  conflicts=("${pkgname%-bin}")

  cd "${srcdir}"
  install -vDm755 "${binary}"  "${pkgdir}/usr/bin/${binary}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${binary}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${binary}/LICENSE.md"
}
