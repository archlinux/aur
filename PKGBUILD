# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=marwanhawari
_pkgname=stew
pkgname=${_pkgname}-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='An independent package manager for compiled binaries'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "SECURITY-${pkgver}.md::${_urlraw}/SECURITY.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
        "CODE_OF_CONDUCT-${pkgver}.md::${_urlraw}/CODE_OF_CONDUCT.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('d44d4dce68dced2e5385e05328403afb276b0319e6d3a4e551b044592bc7034d'
            '31b9eed2b93b7d203d2ccabd2f880a5aec28c3fcb513c6c33e949dee0635d8b4'
            'ea52dc3587929a33aba07df0734ec73998fe395d38ed0ec959dfcdca9bb01a86'
            'ff8206f40f41ace0c11bdf512949945f970c8dbcd42374f45ddfa4182e3966f0'
            'a14821ad68cb49bfed88976e3a152b54c0c2641a6c649067b42ac45e2a3e333a')
sha256sums_x86_64=('a6ef482719dc0354ee20e02e682ddb2e45a4aaf9fccc2dd023e2abed1cb21b95')
sha256sums_i686=('f5ca69464545d75365f8dba7ca1576a84bff9bdce5a2e89158dc90c0e57c94cc')
sha256sums_aarch64=('7b43742838bb7a4ce89cd08234733abc5a370cd4660ca1619a562916bebaa772')

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
