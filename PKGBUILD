# Maintainer: Creptic <creptics@gmail.com>
pkgname=qbtctl-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Minimal CLI for qBittorrent (latest git build)"
arch=('x86_64')
url="https://github.com/creptic/qbtctl"
options=('!debug')
license=('MIT')

# runtime dependencies (Arch package names)
depends=('curl' 'libsodium' 'zlib' 'mbedtls')

# build-time dependencies
makedepends=('git' 'make' 'gcc')

conflicts=('qbtctl' 'qbtctl-bin')
provides=('qbtctl')

# Git source
source=("git+https://github.com/creptic/qbtctl.git")
sha256sums=('SKIP')

# Dynamically generate pkgver from latest git commit
pkgver() {
    cd "$srcdir/qbtctl"
    local commit count
    commit=$(git rev-parse --short HEAD)
    count=$(git rev-list --count HEAD)
    echo "0.0.1.r${count}.g${commit}"
}

build() {
    cd "$srcdir/qbtctl"
    make
}

package() {
    cd "$srcdir/qbtctl"
    install -Dm755 qbtctl "$pkgdir/usr/bin/qbtctl"
}
