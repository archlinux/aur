# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Owloops
_pkgname=updo
pkgname=${_pkgname}-bin
pkgver=0.1.8
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
            '861e2ac77c3fdc4e006a2a1e861058c16609ea59f15538018d399194aecdd746')
sha256sums_x86_64=('eece9ac364004fbbb0a06b831a4d91c6c68138bb781227600e5327772c08795b')
sha256sums_i686=('a204c24235f8398998347ff896fd6db8947d045d46dd204c411f281fdd98b562')
sha256sums_aarch64=('f1b34b66b618cceeaceebf072031b94509a7adcd88c253a23bb04c12f0570adb')

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
