# Maintainer: nespaset <https://github.com/nespaset>
pkgname=sake-git
pkgver=r1.0.1
pkgrel=1
pkgdesc="A new aur helper written in Go, created for people's convenience"
arch=('x86_64' 'aarch64')
url="https://github.com/nespaset/sake"
license=('Apache')
depends=('pacman' 'git' 'binutils')
makedepends=('go')
provides=('sake' 'sk')
conflicts=('sake' 'sk')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  go build -o sk main.go
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 sk "$pkgdir/usr/bin/sk"
}
