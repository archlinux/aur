# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>
pkgname=stow-cm-nightly-bin
_pkgname=stow-cm
pkgver=nightly
pkgrel=6
pkgdesc="config manager (gun-stow like)"
arch=('x86_64')
url="https://github.com/someoneonsmile/${_pkgname}"
license=('GPL2')
# depends=('coreutils')
makedepends=()
conflicts=('stow-cm')
_date="$(date -u +%Y%m%d)"
source=("${_pkgname}${_date}.tar.gz::https://github.com/someoneonsmile/${_pkgname}/releases/download/nightly/${_pkgname}-x86_64-unknown-linux-musl.tar.gz")
sha512sums=('SKIP')

pkgver() {
  # sha256sum ${_pkgname}.tar.gz | cut -d ' ' -f 1

  cd "$srcdir/${_pkgname}${_date}/" || exit 1
  ./${_pkgname} --version | cut -d ' ' -f2
  # expr "$(./${_pkgname} --version)" : '.* \(.*\))'
}

package() {
  cd "$srcdir/${_pkgname}${_date}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
