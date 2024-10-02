# Maintainer:  Humble Penguin <humblepenguinn@gmail.com>
# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="envio"
pkgname="${_pkgname}-bin"
pkgver=0.6.1
pkgrel=1
pkgdesc="A Modern And Secure CLI Tool For Managing Environment Variables"
arch=('x86_64' 'aarch64' 'i686')
url="https://envio-cli.github.io/home"
_url="https://github.com/envio-cli/${_pkgname}"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs' 'glibc' 'gpgme' 'libgpg-error')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-i686-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a66ce6dd0611f823ed8fc4ad8aa9aaed9ef90df9f01254dc812d75acb782b6a4')
sha256sums_aarch64=('63fc3b1256835870967ebbe5e124d95a565ec09b4ac4776dd53d7d4300935ad9')
sha256sums_i686=('23cde12fc9b9ce3c6af9795dea645383e11aacbfefeb920d27946bad1db1aa6b')

package() {
  cd "${srcdir}/${_pkgname}-v${pkgver}-${CARCH}-unknown-linux-gnu"
  install -Dm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
  install -Dm644 "${_pkgname}.1"  "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  cd "autocomplete"
  install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "_${_pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "_${_pkgname}.ps1" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
