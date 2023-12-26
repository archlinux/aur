# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=twitch-cli
pkgver=1.1.22
pkgrel=1
pkgdesc='The official Twitch CLI to make developing on Twitch easier'
arch=(x86_64)
url=https://github.com/twitchdev/twitch-cli
license=(Apache)

provides=($pkgname)
conflicts=($pkgname)
makedepends=(go)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(33884e2ebfde2aa0f5e2d4995f4d0710a19a04f059ff5445dd1a8c974efe55b8)

build () {
    cd "$srcdir"/$pkgname-$pkgver
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    make build
}

package() {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin $pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname README.md docs/*.md
}
