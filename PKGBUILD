# Maintainer: Wilhelm Schuster <aur [aT] rot13 dot io>

pkgname=sctd
pkgver=0.2.0
pkgrel=2
pkgdesc="A daemon to change the display color temperature based on time of day"
url="https://github.com/amir/sctd"
arch=(x86_64 i686)
license=(custom)
depends=(gcc-libs libx11 libxrandr)
makedepends=(cargo)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amir/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('229ff4ab97ee1dadff1e245295291f7fbb8375570419e56c979429bf7d80a0de543ca6e7a01637fd5a76b06e2674dba2721570834701405ccae8286671bf0b39')

build() {
  cd "$pkgname-$pkgver"

  cargo build --release --locked --all-targets
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 target/release/$pkgname -T "${pkgdir}/usr/bin/$pkgname"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

