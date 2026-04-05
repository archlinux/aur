# Maintainer: Mees Fatels
pkgname=emm-git
pkgver=r1.65535f4
pkgrel=1
pkgdesc="Eidolon Minion Manager - terminal AI agent manager"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/meesfatels/EMM"
license=('MIT')
makedepends=('go' 'git')
provides=('emm')
conflicts=('emm')
source=("$pkgname::git+https://github.com/meesfatels/EMM.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    export GOPATH="$srcdir/gopath"
    go build -trimpath -ldflags="-s -w -X main.version=$pkgver" -o emm ./cmd/emm
}

package() {
    cd "$pkgname"
    install -Dm755 emm "$pkgdir/usr/bin/emm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
