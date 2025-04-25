# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=marwanhawari
_pkgname=stew
pkgname=${_pkgname}-bin
pkgver=0.6.0
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
            '8728b70b138c0cd880fc595638fed9f53cfdabe1cd51e07551abe533bbac881b'
            'ea52dc3587929a33aba07df0734ec73998fe395d38ed0ec959dfcdca9bb01a86'
            'ff8206f40f41ace0c11bdf512949945f970c8dbcd42374f45ddfa4182e3966f0'
            'a14821ad68cb49bfed88976e3a152b54c0c2641a6c649067b42ac45e2a3e333a')
sha256sums_x86_64=('0a01b8a57ab219a3a1730d3d0a16f4cdda2e5c83626d57ab0455e995460eeb4f')
sha256sums_i686=('1254fa2a068463249a3dfb59af9cb4ee0d293e70dda85807c9472fd23a61e85c')
sha256sums_aarch64=('00392c503f08d8dfac38d0f35672337db032ea8e0500ba46c4884f3fde4bcf92')

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
