# Contributor: Filipe Nascimento <flipee at tuta dot io>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emulsion-git
pkgver=9.0.r2.ge25e53a
pkgrel=1
pkgdesc="A fast and minimalistic image viewer"
arch=('i686' 'x86_64')
url="https://arturkovacs.github.io/emulsion-website/"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
depends=('gcc-libs' 'hicolor-icon-theme' 'libxcb')
makedepends=('git' 'nasm' 'rust')
source=("git+https://github.com/ArturKovacs/emulsion.git"
        "emulsion.desktop")
sha256sums=('SKIP'
            'a1bdf607a12a4c9a10e15586c6c90afef6985a3f4bd7c451e7c022c17f986aed')

build() {
    cd "${pkgname%-git}"
    cargo build --release --locked
}

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .
}
  
check() {
  cd "${pkgname%-git}"
  cargo test --release --locked 
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 "$srcdir"/${pkgname%-git}.desktop -t "$pkgdir"/usr/share/applications
  install -Dm755 target/release/${pkgname%-git} -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 resource_dev/emulsion.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps
}
