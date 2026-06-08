pkgname=shs-git
pkgver=r1
pkgrel=1
pkgdesc="SharkScript standalone interpreter"
arch=('x86_64' 'aarch64')
url="https://github.com/mayshecry/sharkscript-standalone"
license=('custom')
depends=('glibc')
makedepends=('git' 'go')
source=("git+https://github.com/mayshecry/sharkscript-standalone.git")
sha256sums=('SKIP')

pkgver() {
  cd sharkscript-standalone
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd sharkscript-standalone
  go mod tidy
  go build -o shs main.go
}

package() {
  cd sharkscript-standalone
  install -Dm755 shs "$pkgdir/usr/bin/shs"
}
