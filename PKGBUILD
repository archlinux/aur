# Maintainer: dalz <aur @t alsd d0t eu>
pkgname=gemget
pkgver=1.6.0
_commit=6262222a6c35d98e1e15fe43cd3a0b136b078949
pkgrel=2
pkgdesc='Command line downloader for the Gemini protocol'
arch=('x86_64')
url='https://github.com/makeworld-the-better-one/gemget'
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/makeworld-the-better-one/gemget/archive/v$pkgver.tar.gz")
sha256sums=('2a435af153272c53e82508a1e294142c15259224e94294d15f09c8a0c6f10f7b')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i '/^GIT[VC]/d' Makefile
}

build() {
    cd "$pkgname-$pkgver"
    GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw" \
        make VERSION="$pkgver" COMMIT="$_commit" BUILDER=gemget-AUR
}

package() {
    cd "$pkgname-$pkgver"
    install -D gemget "$pkgdir/usr/bin/gemget"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
