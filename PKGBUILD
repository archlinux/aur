# Maintainer: FallenWarrior2k <aur@sl.fallenwarrior.dev>

pkgname=restic-rest-server
_reponame=rest-server
pkgver=0.13.0
pkgrel=1
pkgdesc="High-performance HTTP server that implements restic's REST backend API"
url='https://github.com/restic/rest-server'
license=(BSD)
arch=(x86_64)
makedepends=(go)
optdepends=('apache: htpasswd manipulation')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc2f57f07fc7affa7d419b8034f2bb7638c14976505966c93f7d75e90ad0d460')
sha512sums=('145ad2da7838a695c8f076298f741b7b6a5013965741d96d766ed0082a58d8361f2bfcf42f39d775577c9d5ea909134f3a2ba5b2604c33ac6fc39d709b78d79d')
b2sums=('de321975ca889a39c00caeac0a6402dd241faf8e55cf8c949861ddab782524ac8593c8847e14fe53eb7e82f9a912a2288ce35236e2f3f15123164ca90cbf96fe')

build() {
    cd ${_reponame}-$pkgver
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"${LDFLAGS}\"" -mod=readonly -modcacherw -o restic-rest-server ./cmd/rest-server
}

check() {
    cd ${_reponame}-$pkgver
    go test ./...
}

package() {
    cd ${_reponame}-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin $pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname {CHANGELOG,README}.md
}
