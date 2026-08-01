# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=riverui
pkgname="${_pkgname}-bin"
pkgver=0.17.0
pkgrel=1
pkgdesc="A web interface for River, fast and reliable background jobs in Go."
arch=('x86_64')
url="https://github.com/riverqueue/riverui"
backup=("etc/${_pkgname}.env")
license=('MPLv2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.gz"
  "https://raw.githubusercontent.com/riverqueue/riverui/refs/tags/v${pkgver}/LICENSE"
  "${_pkgname}.service"
  "${_pkgname}.env"
)

sha256sums=('9f92d64778b55b7aabbfb183e50b6c2f37c551659cc37afcbbecfe3e9b9e81f2'
            '5f6ffaee9f6b91edeceb058d3a37279c64406c7d2685d9d5fb1903d7f04e9288'
            'fd0dce8e4a6138a405b93f7b3a136f968b5368cefa6107a2a92bd436411953ec'
            '961f96396c7d46e950f0aff573289d60a4fafe0c9c0fffe8aac775cf4a762323')

package() {
  install -Dm755 "${srcdir}/${_pkgname}_linux_amd64" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm600 "${srcdir}/${_pkgname}.env" "${pkgdir}/etc/${_pkgname}.env"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/riverui/LICENSE"
}
