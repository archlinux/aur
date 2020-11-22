# Maintainer: dalz <aur @t alsd d0t eu>
pkgname=gemget
pkgver=1.7.0
_commit=3bcb9e511eac67b9c69fc0196eedbbc3d2b21bc4
pkgrel=1
pkgdesc='Command line downloader for the Gemini protocol'
arch=('x86_64')
url='https://github.com/makeworld-the-better-one/gemget'
license=('MIT')
makedepends=('go' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/makeworld-the-better-one/gemget/archive/v$pkgver.tar.gz")
sha256sums=('271e89cf4bf76a78c6efffce4b307c24edae4a04147a3ec3aed2bf0289cc4e12')

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
