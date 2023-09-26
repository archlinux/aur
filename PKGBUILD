# Maintainer: Avi Zimmerman <avi.zimmerman@gmail.com>

pkgname="webmesh-git"
pkgver="0.7.0"
pkgrel="1"
pkgdesc="A service mesh for the web"
arch=("x86_64" "aarch64" "armv6h" "i686" "s390x" "ppc64le")
url="https://webmeshproj.github.io"
license=("Apache-2.0")

makedepends=("make" "go" "nodejs" "yarn")
optdepends=("wireguard-tools: for debugging")
conflicts=("webmesh-bin")

source=("git+https://github.com/webmeshproj/webmesh.git?ref=v$pkgver")
sha256sums=("SKIP")

build() {
    cd "$srcdir/webmesh"
    git fetch --all --tags
    make
}

package() {
    cd "$srcdir/webmesh"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 dist/**/webmesh-node "$pkgdir/usr/bin/webmesh-node"
    install -Dm755 dist/**/wmctl "$pkgdir/usr/bin/wmctl"
}

# vim:set ts=2 sw=2 et:
