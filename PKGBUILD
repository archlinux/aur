# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=tut
pkgver=0.0.46
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys'
arch=('any')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9f255905e63884d1de8fdf73f44a388e763cd2f1c8f5d78103d497975bf1599c')

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
