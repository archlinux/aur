# Maintainer: Richard Steinmetz <steinmetz.richard@googlemail.com>

pkgname=docker-bashbrew
pkgver=0.r156.189add54
pkgrel=1
pkgdesc='Canonical build tool for the official docker images'
arch=('x86_64')
url='https://github.com/docker-library/official-images'
license=('Apache')
depends=('docker>=1:10' 'git')
makedepends=('go')
provides=('bashbrew')
conflicts=('bashbrew')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "official-images"
  printf "0.r%s.%s" "$(git rev-list --count HEAD bashbrew)" "$(git log --oneline bashbrew | head -1 | awk '{printf $1}')"
}

build() {
  cd "$srcdir/official-images/bashbrew/go"
  GO111MODULE=on go build -o bin/bashbrew -mod vendor bashbrew/src/bashbrew
}

package() {
  cd "$srcdir"
  install -Dm 755 official-images/bashbrew/go/bin/bashbrew "$pkgdir/usr/bin/bashbrew"
  install -Dm 644 official-images/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
