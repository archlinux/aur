# Maintainer: SEGFAULT <segfault@mailbox.org>
pkgname=ratman
pkgver=0.3.0
pkgrel=1
pkgdesc='A modular decentralised userspace packet router.'
arch=('any')
url='https://irde.st'
license=('AGPL3')
depends=('libsodium')
makedepends=('git' 'rust' 'protobuf' 'pkg-config' 'clang')
provides=('ratman' 'ratcat' 'ratctl')
conflicts=('ratmand')
source=("${pkgname}::git+https://git.irde.st/we/irdest.git#branch=release/ratman-0.3.0")
sha1sums=('SKIP')

build () {
    cd "${srcdir}/${pkgname}"
    export CARGO_HOME="${srcdir}/${pkgname}/CARGO"
    cargo build --release --all-targets --all-features
}

package() {
  install -Dm644 ${srcdir}/${pkgname}/licenses/AGPL-3.0.md ${pkgdir}/usr/share/licenses/ratman/AGPL-3.0.md
  install -Dm644 ${srcdir}/${pkgname}/licenses/CC-BY.md    ${pkgdir}/usr/share/licenses/ratman/CC_BY.md  
  install -Dm644 ${srcdir}/${pkgname}/licenses/GPL-3.0.md  ${pkgdir}/usr/share/licenses/ratman/GPL-3.0.md
  install -Dm644 ${srcdir}/${pkgname}/licenses/MPL-v2.0.md ${pkgdir}/usr/share/licenses/ratman/MPL-v2.0.md
  
  install -Dm755 ${srcdir}/${pkgname}/target/release/ratmand ${pkgdir}/usr/bin/ratmand
  install -Dm755 ${srcdir}/${pkgname}/target/release/ratcat  ${pkgdir}/usr/bin/ratcat
  install -Dm755 ${srcdir}/${pkgname}/target/release/ratctl  ${pkgdir}/usr/bin/ratctl
}
