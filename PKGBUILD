pkgname=shs-git
pkgver=r1
pkgrel=1
pkgdesc="Sharkscript standalone Compiler & VM"
arch=('x86_64' 'aarch64')
url="https://github.com/mayshecry/sharkscript-standalone"
license=('custom:Sharkscript')
depends=('glibc')
makedepends=('git' 'go')

source=("git+https://github.com/mayshecry/sharkscript-standalone.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/sharkscript-standalone"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sharkscript-standalone"
  export CGO_ENABLED=0
  export GOFLAGS="-mod=readonly"
  go build -o shs main.go
}

package() {
  cd "$srcdir/sharkscript-standalone"
  install -Dm755 shs "$pkgdir/usr/bin/shs"
}
