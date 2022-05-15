# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-mastodon
pkgver=1.0.7
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, only for name collision.'
arch=('any')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('170d609b5181239fcedb4486041fbf5d8f2a078265927f71a6b8761f95f1cec1')

build() {
  cd $_pkgname-$pkgver
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $_pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
