# Maintainer: Luis Martinez
pkgname=rm-improved-git
_pkgname=rip
pkgver=0.13.1.r8.gc528ce9
pkgrel=1
pkgdesc='A safe and ergonomic alternative to rm'
arch=('x86_64')
url='https://github.com/nivekuil/rip'
license=('GPL-3.0')
depends=('gcc-libs')
makedepends=('git' 'rust')
provides=('rm-improved')
conflicts=('rm-improved')
source=("${_pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  cargo build --release --locked
}

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}/target/release/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" "${_pkgname}/LICENSE"
}
