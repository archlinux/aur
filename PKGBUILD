# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Henry Tang <henryykt@gmail.com>

_pkgname=phantomjs
pkgname=${_pkgname}-git
epoch=1
pkgver=3.0.0dev+23+cb1b04bb5
pkgrel=1
pkgdesc="Headless WebKit with JavaScript API"
url="https://phantomjs.org/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('qt5-webkit')
makedepends=('git' 'cmake')
source=("git+https://github.com/ariya/${_pkgname}.git")
sha512sums=('SKIP')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_commit_3_0_0dev='1c53215f8e0f23344a4626d38117d3dc53982f02'

pkgver() {
  cd "${_pkgname}"
  printf "%s+%s+%s" '3.0.0dev' "$(( $(git rev-list --count HEAD) - $(git rev-list --count ${_commit_3_0_0dev}) ))" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
  
  mkdir -p "${pkgdir}/usr/share/${_pkgname}"
  cp -dr --no-preserve=ownership examples "${pkgdir}/usr/share/${_pkgname}"

  install -Dm644 'LICENSE.BSD' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
  install -Dm644 'third-party.txt' "${pkgdir}/usr/share/licenses/${pkgname}/third-party.txt"
}

