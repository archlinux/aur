# Maintainer: Daniel Lublin <daniel@lublin.se>

pkgname=i3gopher
pkgver=1.0.0
pkgrel=1
pkgdesc='i3 wm helper rodent - focus last focused window per workspace'
arch=('x86_64')
url="https://github.com/quite/i3gopher"
license=('BSD')
makedepends=('go-pie')
source=("$url/archive/v1.0.0.tar.gz")
sha256sums=('8e0d7867e71106b5d543da4ea8b241fcf7ae2058e22f9c061dc66d9ec2bf46ac')

build() {
  cd $pkgname-$pkgver
  go build \
     -gcflags "all=-trimpath=$PWD" \
     -asmflags "all=-trimpath=$PWD" \
     -ldflags "-extldflags $LDFLAGS" \
     -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
