# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=smag
pkgver=0.5.5
pkgrel=1
pkgdesc='Easily create graphs from cli commands and view them in the terminal.'
url='https://github.com/aantn/smag/'
source=("$pkgname-$pkgver.tar.gz::https://github.com/aantn/smag//archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT')
makedepends=('cargo')
sha256sums=('124c3420c514d60e68e173fa814aac5e1cfb42e01179ef4cab5890668f227d61')

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
