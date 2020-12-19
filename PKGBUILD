# Maintainer: dalz <aur @t alsd d0t eu>
pkgname=gemget
pkgver=1.8.0
_commit=b32c6f861544e06c162320a56430dc31d35fd774
pkgrel=1
pkgdesc='Command line downloader for the Gemini protocol'
arch=('x86_64')
url='https://github.com/makeworld-the-better-one/gemget'
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/makeworld-the-better-one/gemget/archive/v$pkgver.tar.gz")
sha256sums=('52578dfc33c0275d71658d6afc0e0d91b3734032a6ed5b760d2695001b178c5a')

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
