# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=tut
pkgver=1.0.4
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys'
arch=('any')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aeb7015187057afd1e1e58d747129b94659a16da25d90c3db19a61440dcd34ad')

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
