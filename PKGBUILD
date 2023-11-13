# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=obs-cmd
pkgver=0.15.3
pkgrel=1
pkgdesc="A minimal OBS CLI for obs-websocket v5"
arch=('x86_64')
url="https://github.com/grigio/obs-cmd"
license=('MIT')
makedepends=('git' 'rust')
provides=('obs-cmd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/grigio/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
install=obs-cmd.install

# Upstream tar.gz

sha512sums=('d1ee48a9b79a695796894018201c8ff39ce17fb7ad8a22ebafcf04239aff4b7b2145826a00965c2d01adbf3a1bed905084a276b1fceaef5631d6d10fcbbfefcb')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/target/release/obs-cmd" "${pkgdir}/usr/bin/obs-cmd"
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}