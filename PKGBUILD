# Maintainer: Juan Perdomo (Jakepys) perdomojuan187@gmail.com
pkgname=skip-git
pkgver=r6.9874a75
pkgrel=1
pkgdesc="A replacement for sleep that snores (git version)"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/Jakepys/skip"
license=('GPL-3.0-or-later')
makedepends=('go' 'git')
provides=('skip')
conflicts=('skip')
source=("$pkgname::git+https://codeberg.org/Jakepys/skip.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    go build -o skip .
}

check() {
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dm755 skip "$pkgdir/usr/bin/skip"
    install -Dm644 skip.1 "$pkgdir/usr/share/man/man1/skip.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
