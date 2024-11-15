# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=nthnd
_pkgname=tuime
pkgname=${_pkgname}-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='A colorful and fun TUI clock written in Rust, with a screensaver mode'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc' 'gcc-libs')
optdepends=('cfonts: sexy and colorful fonts for the console')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_${arch[0]}-unknown-linux-musl.tar.xz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'a4edbd476a449cb477785ff3bc0d904da155ae94e527c4394b7c25949a244d85')
sha256sums_x86_64=('7e5de45bc6899475fdbdc59a3a778a4c82ed986e69055301bf819406e664d2cc')

build() {
  cd "${srcdir}/" || exit

  help2man ${_pkgname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
