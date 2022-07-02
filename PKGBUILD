# Maintainer: David Fryer <dfryer1193@gmail.com>

pkgname=sysfex-git
pkgver=r38.905d899
pkgrel=1
pkgdesc="Another neofetch-like system information fetching tool for linux-based systems written in C++"
arch=('x86_64')
url="https://github.com/mehedirm6244/sysfex"
license=('Apache')
depends=('gcc-libs' 'libx11')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("sysfex::git+https://github.com/mehedirm6244/sysfex.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  g++ "src/${pkgname%-git}.cpp" -o "${pkgname%-git}" -std=c++17 -lX11 -lstdc++fs -fpermissive
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r data/* "$pkgdir/opt/${pkgname%-git}/"
  install -Dm755 "${pkgname%-git}" -t "$pkgdir/usr/bin/"
}
