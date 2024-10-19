# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm
_pkgname=stow-cm
pkgver=stable
pkgrel=3
pkgdesc="config manager (gun-stow like)"
arch=('x86_64')
url="https://github.com/someoneonsmile/${_pkgname}"
license=('GPL2')
# depends=('coreutils')
makedepends=()
conflicts=()
source=("${_pkgname}.tar.gz::https://github.com/someoneonsmile/${_pkgname}/releases/download/stable/${_pkgname}-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  # sha256sum ${_pkgname}.tar.gz | cut -d ' ' -f 1

  cd "$srcdir/${_pkgname}-x86_64-unknown-linux-musl/" || exit 1
  ./${_pkgname} --version | cut -d ' ' -f2
  # expr "$(./stow-cm --version)" : '.* \(.*\))'
}

package() {
  cd "$srcdir/${_pkgname}-x86_64-unknown-linux-musl"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
