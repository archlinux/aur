pkgname=ken-git
pkgver=r1.0.1
pkgrel=1
pkgdesc="A sharp AUR/Pacman helper written in Go. Git version."
arch=('x86_64' 'aarch64')
url="https://github.com/nespaset/ken"
license=('Apache')
depends=('pacman' 'git' 'binutils')
makedepends=('go')
provides=('ken' 'kn' 'sk')
conflicts=('ken' 'ken-bin' 'sake-git' 'sk')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  go build -o ken main.go
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 ken "$pkgdir/usr/bin/ken"
  ln -sf /usr/bin/ken "$pkgdir/usr/bin/kn"
}
