# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=silentdragonpaper
pkgver=0.1.4
pkgrel=1
pkgdesc="HUSH paper wallet generator"
url="https://git.hush.is/hush/SilentDragonPaper"
arch=('x86_64')
license=('GPL3')
makedepends=('rust')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('738a535b3ee71d90488dcb235328797c4809769adbeb95d2f108633b65229efe1ff2b2a655407d1690b87ca62d97eb096e4f15667c7b2a9340c4b275d70fd782')

build() {
  tar xzvf v$pkgver.tar.gz
  cd ${pkgname}/cli
  cargo vendor
  cargo build --release --offline
}

package() {
  install -Dm755 "${srcdir}/$pkgname/cli/target/release/SilentDragonPaper" "${pkgdir}/opt/$pkgname/$pkgname"
  install -Dm644 "${srcdir}/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${srcdir}/$pkgname/README.md" "${pkgdir}/opt/$pkgname/README.md"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/silentdragonpaper "${pkgdir}/usr/bin"
}
