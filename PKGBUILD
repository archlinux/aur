# Maintainer: rsteube <rsteube@users.noreply.github.com>
pkgname=carapace
pkgver=0.9.0
pkgrel=1
pkgdesc='multi-shell multi-command argument completer'
arch=('aarch64' 'i686' 'x86_64')
url='https://github.com/rsteube/carapace-bin'
license=('MIT')
makedepends=("go" "git")
source=("git+https://github.com/rsteube/carapace-bin.git#tag=v$pkgver")

sha256sums=('SKIP')

pkgver() {
    cd carapace-bin
    git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
    cd carapace-bin
    cd cmd/carapace && go generate ./... && go build -ldflags="-s -w -X main.version=$pkgver-git" -tags release 
}

package(){
    cd carapace-bin
    install -Dm755 cmd/carapace/carapace -t "$pkgdir/usr/bin"
}
