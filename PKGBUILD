# Maintainer: Hanashiko <hlichisper@gmail.com>
pkgname=jwtk
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI/TUI tool for decodeing, validating and generating JWT tokens"
arch=('x86_64')
url="https://github.com/Hanashiko/jwtk"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=('main.go' 'go.mod' 'go.sum' 'LICENSE')
sha256sums=('8d3f9dddc3d84115d246c9e073e050fb7f5a973259decc9841e1523a52ad3822'
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
