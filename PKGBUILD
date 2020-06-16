# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=sctd
pkgver=0.1.2
pkgrel=1
pkgdesc="A Daemon to change the display color temperature based on time of day"
url="https://github.com/amir/sctd"
arch=(x86_64 i686)
license=(custom)
depends=(gcc-libs libx11 libxrandr)
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amir/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8066d7d51487d667f90c617f041aa423fc046f0401533abf37185c325edf5c49b918aeb34c65e566c15c0e304fc838fec76a50ddf928953980baa5449091ce83')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --all-targets
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 target/release/main -T "${pkgdir}/usr/bin/$pkgname"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

