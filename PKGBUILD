# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Jojo4GH
_pkgname=nav
pkgname=${_pkgname}-bin
pkgver=1.4.5
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
            'f29b0f00a5394e93f3468b872940771a9ea655496bbfa93f80677506ecd8f0df')
sha256sums_x86_64=('3740b6acb28c34882178d4e34d2b5639896236e30a3cfa31aad2c0412555d786')
sha256sums_aarch64=('925f82b575e6805f605396ae1480c257604e6455a1d395df13c3ad6c3067aecd')

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
