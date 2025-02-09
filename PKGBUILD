# Maintainer: Pol Rivero <aur at polrivero dot com>
pkgname=doot
pkgver=0.0.4
pkgrel=1
pkgdesc="A fast and simple dotfiles manager that just gets the job done"
arch=('x86_64' 'aarch64')
url="https://github.com/pol-rivero/doot"
license=('MIT')
provides=('doot')
conflicts=('doot')

depends=('git' 'git-crypt')
makedepends=('git' 'go' 'make')
optdepends=('diffutils: To display changes before overwriting a file')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pol-rivero/doot/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    tar -xzf "${pkgname}-${pkgver}.tar.gz"
    cd "${pkgname}-${pkgver}"
    make build
}

package() {
    cd "${pkgname}-${pkgver}"
    if [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "dist/doot-linux-arm64" "$pkgdir/usr/bin/doot"
    else
        install -Dm755 "dist/doot-linux-x86_64" "$pkgdir/usr/bin/doot"
    fi
}
