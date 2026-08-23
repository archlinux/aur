# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sibprogrammer
_pkgname=xq
pkgname=${_pkgname}-bin
pkgver=1.5.1
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
sha256sums=('9bd0ac2fc09d545f5456a74f17bb7a17aea954ad74c1627a14187149747eb37d'
            'a85afadf87e356f7aca6a90909b113cd2c4e1a164cb113bbb670660b1481a2b8')
sha256sums_x86_64=('40ec8915ca3809bc6cdd75eeacdeb8e31276f82bdaca1bfa0b4a5260d8416414')
sha256sums_i686=('4ebfd7323eebbf43490fadaa1bb5823cdb4bf3822c63abf929fc1f5f6a78cd2d')
sha256sums_aarch64=('e69e382c6fb7c39457a0cbd7b088970cf0dced47c15c01596c78a403560289ca')

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
