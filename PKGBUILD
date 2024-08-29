# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tran"
pkgname="${_pkgname}-bin"
pkgver=0.1.43
pkgrel=2
pkgdesc="Securely transfer and send anything between computers with TUI"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/abdfnx/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.zip"
           "${_pkgsrc}-i686.zip"
           "${_pkgsrc}-aarch64.zip"
           "${_pkgsrc}-armv7h.zip")
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver}_amd64.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver}_386.zip")
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver}_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgname}_linux_v${pkgver}_arm.zip")
sha256sums=('0515d8312208152fdedabedd0fc787a623edd2d085e97e5ba8935bafb4f4524c')
sha256sums_x86_64=('1f74c18b8d6cd1f6ea8f687c8d027957a63ce16637543e89db043b58b6f03d40')
sha256sums_i686=('b79d218583efae7290b68a42ef607c805c4c6a322f624d4d440d9db36cc6bcbc')
sha256sums_aarch64=('1826a899791bc1e282d61b932dd73daca987f853eab76df8df35a967fdbe395f')
sha256sums_armv7h=('4d933c117658e981296baa55dfb4439a7651e6727fdcc75e6c281a5201397b3a')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}"

  bsdtar -xzf "${_pkgsrc}-${CARCH}.zip" --strip-components 1 -C "${srcdir}/${_pkgsrc}-${CARCH}"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "${_pkgsrc}-${CARCH}"
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}