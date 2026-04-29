# Maintainer: Ralph Torres <mail at ralphptorr dot es>
# Contributor: zneix <zneix@zneix.eu>

_pkgname=twitch-cli
pkgname=$_pkgname-git
pkgver=r224.b779fcf
pkgrel=1
pkgdesc='The official Twitch CLI to make developing on Twitch easier'
arch=(x86_64)
url=https://github.com/twitchdev/twitch-cli
license=(Apache-2.0)

provides=($_pkgname)
conflicts=($_pkgname)
makedepends=(git go)
source=(git+$url)
sha512sums=(SKIP)

pkgver() {
    cd "$srcdir/twitch-cli"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/twitch-cli"
    go build --ldflags "-X main.buildVersion=source" -o twitch
}

package() {
    cd "$srcdir/twitch-cli"
    install -Dm 755 twitch "$pkgdir/usr/bin/twitch"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
