# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=adamperkowski
_pkgname=nvrs
pkgname=${_pkgname}-bin
pkgver=0.1.8
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc='Fast new version checker for software releases'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')

depends=('glibc' 'gcc-libs' 'openssl')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=(!strip)
source_x86_64=("${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}.tar.gz")
sha256sums_x86_64=('93a4821367857a13dabd16b6801b332bcd858b344293eee5fa7d426c9a6093d9')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "SECURITY.md" "${pkgdir}/usr/share/doc/${pkgname}/SECURITY.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"

  install -Dm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  install -Dm644 "nvrs.toml" "${pkgdir}/usr/share/doc/${pkgname}/samples/nvrs.toml"
  install -Dm644 "n_keyfile.toml" "${pkgdir}/usr/share/doc/${pkgname}/samples/n_keyfile.toml"
}
