# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
pkgname=fileviewer-git
pkgver=r34.d767792
pkgrel=1
pkgdesc="TUI file viewer in C for Unix systems"
arch=('x86_64')
url="https://github.com/velorek1/fw"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'fw')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make fw CFLAGS="${CFLAGS} -fsigned-char" LDFLAGS="${LDFLAGS}"
}

package() {
  cd "$pkgname"
  install -Dvm 755 fw -t "$pkgdir/usr/bin/"
  install -Dvm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
