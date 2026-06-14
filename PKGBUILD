# Maintainer: Lukas <lukas@example.com>
pkgname=webscript-git
pkgver=r9.5582503
pkgrel=1
pkgdesc="A high-performance reverse proxy and web server language"
arch=('x86_64')
url="https://github.com/LukasYTTT/webscript"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('webscript' 'wbs')
conflicts=('webscript')
source=('git+https://github.com/LukasYTTT/webscript.git')
sha256sums=('SKIP')

pkgver() {
  cd webscript
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd webscript
  export CGO_ENABLED=0
  go build -trimpath -o wbs .
}

package() {
  cd webscript
  install -Dm755 wbs "$pkgdir/usr/bin/wbs"
  ln -s /usr/bin/wbs "$pkgdir/usr/bin/webscript"
}
