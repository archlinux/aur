pkgname=markdown-to-standalone-html
pkgver=0.5.0
pkgrel=1
pkgdesc="Create a standalone HTML file from Markdown with basic CSS, table of contents and source code highlighting"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/markdown-to-standalone-html"
license=('MIT')
depends=()
makedepends=('cargo')
optdepends=('monolith: inline assets like images or CSS')
provides=("markdown-to-standalone-html")
conflicts=("markdown-to-standalone-html")

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('d65f119ac4db6294f5ee5d124b621d868457ec69874cbe42fcc2d72ad23c6ac0')

build() {
  cd $pkgname-$pkgver
  cargo build --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 target/release/$pkgname -t "$pkgdir"/usr/bin
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname

  install -Dm644 "completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
  install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
