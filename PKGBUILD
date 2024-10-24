# Maintainer: Christopher Ferreira <aumgn@free.fr>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=isacikgoz
_pkgname=gitbatch
pkgname=${_pkgname}-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A TUI to manage your git repositories in one place"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
arch=('x86_64' 'i686' 'aarch64')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=(https://github.com/isacikgoz/gitbatch/releases/download/v${pkgver}/gitbatch_${pkgver}_linux_amd64.tar.gz)
source_i686=(https://github.com/isacikgoz/gitbatch/releases/download/v${pkgver}/gitbatch_${pkgver}_linux_386.tar.gz)
source_aarch64=(https://github.com/isacikgoz/gitbatch/releases/download/v${pkgver}/gitbatch_${pkgver}_linux_arm64.tar.gz)
sha512sums=('e29c0d311892210f824716f36eb619db5e39be734ab5202c76c18908e9d3ec3cf541b4e9d8b04e7ade0cdfe10bf331a79890fe815d09ce7facd793168f288256'
            'f98b3ef21f688be6751dfc71f4aa89a5bac1c3011887756e8cdeb47d00f4987d400fbc1b4667128f7211b882d576e6f8863411e9d7ebed06e4d4eb3125f5853c')
sha512sums_x86_64=('cc6132565484647607ff8a9760ace512d777b7aac418684a2aa97310afb8dc08d4799908ac3feb1b0cc760e32e7bf502c4bbdc642e3db871c629649f3b316efc')
sha512sums_i686=('5a4c3fdf08ccca03e9c2e07b0a32863645cb53e359d6f6af30cea183d8bfa22add6d136c8f8a0bff57dcaa5434f9f70400650901774468c6271b6ddbb4382b5c')
sha512sums_aarch64=('501ebe46b0b7725e8230c5af5e2237c350919367d6d26091cc456bc0af0a46a61f63fd416089ca784f9e2a7a8850cc4017830400050a0796dfffe1e567203e41')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info --no-discard-stderr
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
