# Maintainer: Zoey Sheffield <me@zoey.fyi>

pkgname='tex-match'
pkgver='1.2.0'
pkgrel='1'
pkgdesc="Find LaTeX symbols by sketching. A desktop version of detexify."
arch=('x86_64')
url='https://github.com/zoeyfyi/TeX-Match'
license=('MIT')
depends=('gtk3')
makedepends=(
  'rust>=1.46.0'
  'git'
)
source=("TeX-Match::git+https://github.com/zoeyfyi/TeX-Match#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd TeX-Match
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  install -Dm755 "TeX-Match/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "TeX-Match/data/fyi.zoey.TeX-Match.svg" -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 "TeX-Match/data/fyi.zoey.TeX-Match.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "TeX-Match/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "TeX-Match/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
