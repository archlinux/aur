# Maintainer: Aaron Coach <aur@awc.id.au>
_pkgname=riverui
pkgname="${_pkgname}-bin"
pkgver=0.16.0
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

sha256sums=('4f83c0c8e9c9948a84e199a02202c9834f1b41d58e43ce0b9e13bf4e3bd7e5db'
            '5f6ffaee9f6b91edeceb058d3a37279c64406c7d2685d9d5fb1903d7f04e9288'
            'fd0dce8e4a6138a405b93f7b3a136f968b5368cefa6107a2a92bd436411953ec'
            '96a99246f11ed7ef754f2b8a3718ac49a4f0b30c1ad034ef421de5afda2298ba')

package() {
  install -Dm755 "${srcdir}/${_pkgname}_linux_amd64" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm600 "${srcdir}/${_pkgname}.env" "${pkgdir}/etc/${_pkgname}.env"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/riverui/LICENSE"
}
