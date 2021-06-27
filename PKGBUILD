# Maintainer: Jerry Ling <jerry.ling ^at% cern.ch>

pkgname=gocloc-git
pkgver=v0.4.1.r17.g734d3a7
pkgrel=1
epoch=1
pkgdesc="A little fast cloc(Count Lines Of Code)"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=()
makedepends=('git' 'go' 'make')
optdepends=()
url="https://github.com/hhatto/gocloc"
license=('MIT')
source=(git+https://github.com/hhatto/gocloc)
sha256sums=('SKIP')
provides=('gocloc')
conflicts=()

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed "s+-+.r+" | tr - .
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  make
}

package() {
  cd ${pkgname%-git}
  echo $PWD
  msg2 'Installing executables...'
  install -Dm 755 bin/gocloc -t "$pkgdir"/usr/bin

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
