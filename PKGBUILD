# Maintainer: FallenWarrior2k <aur@sl.fallenwarrior.dev>

pkgname=restic-rest-server
_reponame=rest-server
pkgver=0.14.0
pkgrel=1
pkgdesc="High-performance HTTP server that implements restic's REST backend API"
url='https://github.com/restic/rest-server'
license=(BSD)
arch=(x86_64)
makedepends=(go)
optdepends=('apache: htpasswd manipulation')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b3f91d561819ba9bce454505958fcca6d61ecd12e10086954ebfc92ba163ba4')
sha512sums=('d73ff775b740887e869109e8811520640927f44b94837a194d1b1bd8db02b69ce9ae84e645d7a5b3117e40e75a3ca8aab7e9f7c2e3f58db24ca6026f23109775')
b2sums=('578a8872e60060aeece99366fe7eadd0d694e3052a1553a309c5fd100d753c3b0c90f8fd231c1f338fc8c8b70553b00a3ba44b029361629e359bb1cf28742caf')

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
