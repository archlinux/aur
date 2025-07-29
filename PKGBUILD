# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Owloops
_pkgname=updo
pkgname=${_pkgname}-bin
pkgver=0.2.5
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
            '10105d94dcec41a6272dbe5e6fec47af9b1ccb8b7c53e73e4412059af957ec8c')
sha256sums_x86_64=('d30b5c2742801f70664b94aedc380180c815945ab33c1705600701a47feee55e')
sha256sums_i686=('a33e523e2f9f85e0539b82cd60f6220ef8e1fad7852a3ec6632c9db338292a41')
sha256sums_aarch64=('1dd5d71935b849b0175ec69eabafe232eb81bce224f95c9dfebf451056539926')

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
