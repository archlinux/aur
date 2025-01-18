# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=wcampbell0x2a
_pkgname=heretek
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Yet Another GDB TUI Frontend'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('Apache-2.0 OR MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE"
        "LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-musl.tar.gz")
sha256sums=('fd26644b0118c8ae84a8770bdbbe18f7db14387b5cc19d1de670ad2d98a7ad42'
            '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3'
            '99b351f32748f51b08e6557606c3653ed06879dcffdc88cc7c3ead0783e076b2')
sha256sums_x86_64=('4e0b18415d55ac28224a401805b88517692b74b8dbbd17d2e6ddd4f4a81f261f')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
