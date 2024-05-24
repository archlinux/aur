# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=smag
pkgver=0.8.0
pkgrel=1
pkgdesc='Easily create graphs from cli commands and view them in the terminal.'
url='https://github.com/aantn/smag/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/aantn/smag//archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
makedepends=('cargo')
sha256sums=('3a70accf49b1ac2324fab93afd6ed2e3fa98f137f3d63c52d7e9b6be15e68fa0')

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo test --release --locked --target-dir=target
}

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}
