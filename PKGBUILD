# Maintainer: Daniel Lublin <daniel@lublin.se>

pkgname=i3gopher
pkgver=1.1.2
pkgrel=1
pkgdesc='i3 / sway wm helper rodent - focus the last focused window (per workspace)'
arch=('x86_64')
url="https://github.com/quite/i3gopher"
license=('BSD')
makedepends=('go-pie')
source=("$url/archive/refs/tags/v1.1.2.tar.gz")
sha256sums=('8362ca36555c7fee1b38ebfbeb5fc97be69517c66821c8cc7b8b64dad7afc0bd')

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
