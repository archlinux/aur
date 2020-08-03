# Maintainer: Alexis Lopez ZUbieta <contact at azubieta dot net>

_pkgname=appimage-manager
pkgname=appimage-manager
pkgver=0.1.2
pkgrel=1
pkgdesc="AppImage package manager."
arch=('x86_64')
url="https://github.com/AppImageCrafters/$_pkgname"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
  git submodule update --init --recursive
  go get -v -t -d ./...
}

build() {
  cd $_pkgname
  go build -o ./dist/app -v ./app
}

package() {
  cd $_pkgname

  install -Dm755 dist/app $pkgdir/usr/bin/app
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
