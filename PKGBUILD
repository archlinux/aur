# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonpaper
pkgver=0.1.3
pkgrel=2
pkgdesc="HUSH paper wallet generator"
url="https://git.hush.is/hush/SilentDragonPaper"
arch=('x86_64')
license=('GPL3')
makedepends=('rust')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('4fade10114af3f0c83d87b93b95e5164692b16611fae4fd80fa2d39fa460c76b')

build() {
  tar xzvf v$pkgver.tar.gz
  cd ${pkgname}/cli
  cargo build --release
}

package() {
  install -Dm755 "${srcdir}/$pkgname/cli/target/release/SilentDragonPaper" "${pkgdir}/opt/$pkgname/$pkgname"
  install -Dm644 "${srcdir}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/$pkgname/README.md" "${pkgdir}/opt/$pkgname/README.md"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/silentdragonpaper "${pkgdir}/usr/bin"
}
