pkgname=autotorrent-git
pkgver=r2.edcfa75
pkgrel=1
pkgdesc='Make torrent files using Go and preset profiles.'
arch=(any)
depends=()
makedepends=(go)
source=("git+https://github.com/varyoo/mktorrent")
md5sums=(SKIP)

pkgver() {
  cd mktorrent
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    go get -u github.com/spf13/viper github.com/pkg/errors github.com/zeebo/bencode
    cd mktorrent/autotorrent
    go build
}
package() {
	cd mktorrent/autotorrent
    install -Dm755 autotorrent "$pkgdir"/usr/bin/autotorrent
}
