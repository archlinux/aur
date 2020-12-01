# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=smag
pkgver=0.5.3
pkgrel=1
pkgdesc='Easily create graphs from cli commands and view them in the terminal.'
url='https://github.com/aantn/smag/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/aantn/smag//archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
makedepends=('cargo')
sha256sums=('6dcafcb7431b4b9822683d65aad436f1caedc5a0497695b81ec90cb4680f70e6')

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
