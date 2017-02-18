# Maintainer: Daniel M. Capella <polyzen@archlinux.info>

pkgname=wego
pkgver=2.0.r33.g6f7b2f4
pkgrel=1
pkgdesc='Weather app for the terminal'
url=https://github.com/schachmat/wego
arch=('any')
license=('ISC')
makedepends=('git' 'go')
source=("wego-$pkgver.tar.gz::$url/archive/6f7b2f4b18f85766b6199b574f42c72ef4539c45.zip")
sha512sums=('f7c0d2da770ff311c62c4ab9e539edbd785ac21dbf7578d281876e621bb933c5ed168597d209c5140e686e3f27df5a3d89a87a49cc42298dd5af2c29fe03d09a')

prepare() {
  local tmp=${source##*/}
  mkdir -p src/github.com/schachmat
  ln -rsnf wego-${tmp%\.*} src/${url#*//}
}

build() {
  local tmp=${source##*/}
  cd wego-${tmp%\.*}
  export GOPATH="$srcdir"
  go get -u -v github.com/schachmat/ingo
  go get -u -v github.com/mattn/go-colorable
  go get -u -v github.com/mattn/go-runewidth
  go build -v
}

package() {
  local tmp=${source##*/}
  cd wego-${tmp%\.*}
  install -Dm755 wego-${tmp%\.*} "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
