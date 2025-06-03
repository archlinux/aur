# Maintainer: Hanashiko <hlichisper@gmail.com>
pkgname=jwtk
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI tool for decodeing, validating and generating JWT tokens"
arch=('x86_64')
url="https://github.com/Hanashiko/jwtk"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=('main.go' 'go.mod' 'go.sum' 'LICENSE')
sha256sums=('d85135512263ccc0ef66bdb3bc11ee33c8f3046638a320153898f9d6a68f52b1'
    '0c3a8cdc4eec061dd960248c8bd960d7611a308ee0fd0cdf24eb74b2a2eef89b' 
    '5a21a9a2128cdf32dd0d2d3b45391edbd78db948f3b37970b0d6a7252be84c93' 
    '60a21faf5459b93996f566dde48d4bb44218cec03417bbcdd6c4731ef3b31bf5')

build() {
    go build -trimpath -buildmode=pie -ldflags="-linkmode=external -extldflags=-Wl,-z,relro,-z,now -s -w" -o "$pkgname" main.go
}

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
