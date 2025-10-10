# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Jojo4GH
_pkgname=nav
pkgname=${_pkgname}-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='The interactive and stylish replacement for ls & cd!'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'gcc-libs' 'libxcrypt-compat')
makedepends=('help2man')
conflicts=("${_pkgname}" "${_pkgname}-cli")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('d5532d342ac8c329541cd225a66c5cfdcac577dbb400024cae4b5195ba5e95ea'
            '748daa59eb6a4ec8ec929ee6774857d38d4f848d418b7fc5d5df9bf10ac9eb3d')
sha256sums_x86_64=('2d0770f3f57528534ce93635ac5b7f46266e89141733ef073469095c3ac4fe6c')
sha256sums_aarch64=('48c71d9d4c4a6c9e465c1df9f1682520c88f1d6b27d6e5678cdf5488bdd5e9d9')

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
