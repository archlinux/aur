# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=lspx-git
pkgver=r41.1b9649f
pkgrel=1
pkgdesc="A language server multiplexer, supervisor, and interactive shell"
arch=('x86_64')
url="https://github.com/thefrontside/lspx"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('deno' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('lspx::git+https://github.com/thefrontside/lspx')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  deno task compile
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 "dist/lspx" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
