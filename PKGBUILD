# Maintainer: Rasmus Lindroth <rasmus@lindroth.xyz>
pkgname=tut
pkgver=1.0.6
pkgrel=1
pkgdesc='A TUI for Mastodon with vim inspired keys'
arch=('any')
url="https://github.com/RasmusLindroth/$pkgname"
license=('MIT')
makedepends=('go')
source=("https://github.com/RasmusLindroth/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fb74c2863153fc3a99f6b2ca2de33012e7aaf268b6896546a22c7ff7a5f196bb')

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
