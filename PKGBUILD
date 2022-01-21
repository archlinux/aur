# Maintainer: Daniel Lublin <daniel@lublin.se>

pkgname=i3gopher
pkgver=1.1.1
pkgrel=1
pkgdesc='i3 wm helper rodent - focus the last focused window (per workspace)'
arch=('x86_64')
url="https://github.com/quite/i3gopher"
license=('BSD')
makedepends=('go-pie')
source=("$url/archive/v1.1.1.tar.gz")
sha256sums=('47b77910118fbb18bdbe09f696497c7611860c1f96b8d825a6d84eacd35d48e0')

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
