# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sibprogrammer
_pkgname=xq
pkgname=${_pkgname}-bin
pkgver=1.2.5
pkgrel=1
pkgdesc='Command-line XML and HTML beautifier and content extractor'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}" 'yq')
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('394421490c78d4bdc96539abe41466a3d5716dc1a624e6a531b886756edba64d'
            '9e49fe288776e0554f01d3c1de8ead3367512c253e74ed4d9a7e0cb0250a578d')
sha256sums_x86_64=('7aad6e08108318dbb2b8f3029f6145fce758e903a1513d9f1aeb090ab212ec8d')
sha256sums_i686=('7a3528d7a4a1552a7abc1151909da020d649938716123a460e059e7bbb446ce7')
sha256sums_aarch64=('11633a9c98d6c8841dbe1db62ce649c7c8b9aeabd3fb0f63484a0dcc23f26566')

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
