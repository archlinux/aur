# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

_pkgname=calc
pkgname=coriolinus-${_pkgname}
pkgver=0.5.0
pkgrel=2
pkgdesc='Rust command line calculator'
url="https://github.com/coriolinus/${_pkgname}"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('glibc' 'libgcc')
makedepends=('rust')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('61cd9944c7dae9a05c5d5581299d1fbd18b9919100a59705a6ca7ac61d206953')

build() {
  cd "${_pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dvm0755 target/release/${_pkgname} -t ${pkgdir}/usr/bin
  install -Dvm0644 README.md CHANGELOG.md -t ${pkgdir}/usr/share/doc/${pkgname}
}
