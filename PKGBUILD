# Maintainer: Hoream <2175223953@qq.com>
_pkgname="totalmapper"
pkgname="${_pkgname}-git"
pkgver=1.4.2.r3.g30cfc9a
pkgrel=1
pkgdesc="A simple utility for remapping keys using the Linux event handling system."
arch=(x86_64)
url="https://github.com/ellbur/totalmapper"
license=('GPL3')
depends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
makedepends=('cargo')
source=("${_pkgname}::git+https://github.com/ellbur/${_pkgname}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}


build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/target/release/totalmapper" "${pkgdir}/usr/bin/totalmapper"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/" "${srcdir}/${_pkgname}/README.md"   
}
