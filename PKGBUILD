# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
_pkgname=tut
pkgname=tut-mastodon
pkgver=0.0.44
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys. Same as aur/tut, only for name collision.'
arch=('any')
url="https://github.com/RasmusLindroth/$_pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('653e156ecf0c1976e5f86077f07081b74ebd9188757e24c7c857a833c8f814ce')

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
