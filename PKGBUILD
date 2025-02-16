# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm
_pkgname=stow-cm
pkgver=stable
pkgrel=7
pkgdesc="config manager (gun-stow like)"
arch=('x86_64')
url="https://github.com/someoneonsmile/${_pkgname}"
license=('GPL2')
# depends=('coreutils')
makedepends=()
conflicts=('stow-cm-nightly-bin')
_date="$(date -u +%Y%m%d)"
source=("${_pkgname}${_date}.tar.gz::https://github.com/someoneonsmile/${_pkgname}/releases/download/stable/${_pkgname}-${CARCH}-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  # sha256sum ${_pkgname}.tar.gz | cut -d ' ' -f 1

  cd "$srcdir/${_pkgname}-${CARCH}-unknown-linux-musl/" || exit 1
  ./${_pkgname} --version | cut -d ' ' -f2
  # expr "$(./stow-cm --version)" : '.* \(.*\))'
}

package() {
  cd "$srcdir/${_pkgname}-${CARCH}-unknown-linux-musl"

  # bin
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # LICENSE
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # man
  install -Dm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"

  # complete
  install -Dm644 "complete/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "complete/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "complete/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
}
