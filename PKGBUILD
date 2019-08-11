# Maintainer: eugene

_pkgname=picofeed
pkgname=go-picofeed-git
pkgver=r18.a8c410b
pkgrel=1
epoch=
pkgdesc="Golang minimal terminal rss reader."
arch=('aarch64' 'x86_64')
url="https://github.com/seenaburns/picofeed"
license=('BSD')
makedepends=('git' 'go')
conflicts=('go-picofeed')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  GOPATH=$srcdir go build
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 picofeed "$pkgdir/usr/bin/picofeed"
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
  GOPATH=$srcdir go clean -modcache
}
