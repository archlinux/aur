# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Owloops
_pkgname=updo
pkgname=${_pkgname}-bin
pkgver=0.1.7
pkgrel=1
pkgdesc="Uptime monitoring CLI tool with alerting and advanced settings"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums=('c4bb03bd6f1bc39a9a068700598796514a826d115a8a10c5d3fb9593ccbda18e'
            '031680a1a872f052b26b2946445d9780178df2d69a45250b7d3eddcf4f49f994')
sha256sums_x86_64=('f452a74ec5056d2f6a4142d9276f0f4056c782ec96946d3ecfdffb8f2c2d00f6')
sha256sums_i686=('c2bb5878565d7f1fdee154d87b3d92f34209290271e08e9c927bcbd4ed4aebfe')
sha256sums_aarch64=('e574959200cf52362c9225a3e454c69c17697cc72ed90eb9c5a1544777fdd637')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
