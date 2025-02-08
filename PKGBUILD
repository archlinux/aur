# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot-git
pkgver=0.0.0
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done (git version)"
arch=('x86_64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
makedepends=('git' 'go' 'make')
optdepends=('diffutils: To display changes before overwriting a file')

source=("git+https://github.com/pol-rivero/doot.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/doot"
    echo "$(date +%Y%m%d).$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/doot"
    make build
}

package() {
    cd "$srcdir/doot"
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "dist/doot-linux-arm64" "$pkgdir/usr/bin/doot"
    else
        install -Dm755 "dist/doot-linux-x86_64" "$pkgdir/usr/bin/doot"
    fi
}
