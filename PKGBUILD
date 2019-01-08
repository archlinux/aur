# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

_name=tldr
pkgname=tldr-cpp-client
pkgver=1.3.1
pkgrel=2
pkgdesc='C++ client for tldr: a simplified and community-driven man pages'
arch=('i686' 'x86_64')
# url="https://github.com/tldr-pages/${pkgname}"
url="https://github.com/Accurate0/${pkgname}"
depends=('curl' 'libzip')
makedepends=('gcc')
license=('MIT')
provides=("${_name}=${pkgver}")
conflicts=('nodejs-tldr')
replaces=('nodejs-tldr')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('79fe03c67d05fd79d0743c5934108a76041b82ece29a0422e60e9d6adb40414d')

build() {
  make -C "${srcdir}/${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "man/${_name}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"
}

# vim:set ts=2 sw=2 et:
