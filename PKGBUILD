pkgname=ligmashark-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Go-based packet capture tool with optional AI analysis (git version)"
arch=('x86_64')
url="https://github.com/mayshecry/ligmashark"
license=('MIT')

depends=('libpcap')
makedepends=('go' 'git')

source=("git+https://github.com/mayshecry/ligmashark.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/ligmashark"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ligmashark"
  go build -o ligmashark main.go
}

package() {
  cd "$srcdir/ligmashark"
  install -Dm755 ligmashark "$pkgdir/usr/bin/ligmashark"
}
