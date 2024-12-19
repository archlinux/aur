# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=lotabout
_pkgname=rargs
pkgname=${_pkgname}-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="A kind of xargs + awk with pattern-matching support"
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
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('08ef4caff3b31b5c6476cae1664a3ee2971f9adf59c0b8c7552da3bf950ebd6c'
            '6e47aa2a6f88b46fd15a3723dd9ec6dd0f22f9a413e1fa18990d19cb04a4a9ed')
sha256sums_x86_64=('c3090de95e5cf82aa53627cfbef62a62c6976052affbec0f689f99c3433b0f1f')
sha256sums_i686=('16e63a1d38f10fd9739d13a22e737c08e76c62b764e4bb81ea74eba48d8b8a0d')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
