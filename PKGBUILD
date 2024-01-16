# Maintainer: Simeon Schaub <simeondavidschaub99@gmail.com>
pkgname=juliaup
pkgver=1.13.0
pkgrel=1
pkgdesc="An experimental Julia version manager"
arch=('x86_64' 'x86' 'aarch64')
url="https://github.com/JuliaLang/juliaup"
license=('MIT')
depends=()
makedepends=('rust')
checkdepends=()
optdepends=()
provides=('julia')
conflicts=('julia' 'julia-bin')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('b1e41a654f204e1ec2b88436b277e688')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release --bin juliaup --bin julialauncher --features binjulialauncher --target-dir ./target
}

package() {
  install -Dm644 "${srcdir}/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/juliaup/LICENSE"
  install -Dm755 "${srcdir}/$pkgname-$pkgver/target/release/juliaup" "${pkgdir}/usr/bin/juliaup"
  install -Dm755 "${srcdir}/$pkgname-$pkgver/target/release/julialauncher" "${pkgdir}/usr/bin/julialauncher"
  ln --relative -s "${pkgdir}/usr/bin/julialauncher" "${pkgdir}/usr/bin/julia"
}

# vim: ts=2 sw=2 et:
