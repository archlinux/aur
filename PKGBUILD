# Maintainer: Magrid0 <magrid0 at proton dot me>
pkgname=chmod-cli-git
pkgver=r20211220.rfce9a8c
pkgrel=1
pkgdesc="A simple cli tool that brings the chmod command in tui format. Generate permissions for files and directories by selecting easy to read config options and copy the result both in numeric and symbolic format."
arch=('x86_64')
url="https://github.com/Mayowa-Ojo/chmod-cli"
license=('MIT')
depends=()
makedepends=('go' 'git' 'make')
source=('git+https://github.com/Mayowa-Ojo/chmod-cli.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/chmod-cli"
  echo "r$(date -u -d @$(git log -1 --format='%ct') +%Y%m%d).r$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/chmod-cli"
  go mod vendor
}

build() {
  cd "$srcdir/chmod-cli"
  export GO111MODULE=on
  go build -o dist/chmod-cli
}

package() {
  install -Dm755 "$srcdir/chmod-cli/dist/chmod-cli" "$pkgdir/usr/bin/chmod-cli"
}
