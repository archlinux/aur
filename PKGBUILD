# Maintainer: Michael Yang <ohmyarchlinux@protonmail.com>

_pkgname=cargo-watch
pkgname=${_pkgname}-git
pkgver=7.2.0.r234.faa34e1
pkgrel=1
pkgdesc='Watches over your Cargo project’s source'
arch=('x86_64')
url='https://github.com/passcod/cargo-watch'
license=('custom: CC0-1.0')
makedepends=('cargo')
conflicts=('cargo-watch')
provides=('cargo-watch')
source=('git+https://github.com/passcod/cargo-watch.git')
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  echo $(git describe --tags).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD) | cut --characters=2-
}

build() {
  cd ${_pkgname}
  cargo build --release
}

package() {
  cd ${_pkgname}
  install -Dm755 target/release/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
