# Maintainer: antiquete <antiquete@proton.me>

pkgname=opencode-sandbox-git
pkgver=1.6.1
pkgrel=1
pkgdesc="Run OpenCode inside an isolated Docker sandbox (git master)"
arch=("any")
url="https://github.com/Antiquete/opencode-sandbox"
license=("GPL-3.0-or-later")
depends=("bash" "docker")
makedepends=("git" "make" "gcc")
source=("opencode-sandbox::git+https://github.com/Antiquete/opencode-sandbox.git")
sha256sums=("SKIP")

pkgver() {
    cd "$srcdir/opencode-sandbox"
    git describe --always --tags --dirty | sed 's/^v//; s/-/./g'
}

build() {
    cd "$srcdir/opencode-sandbox"
    make
}

package() {
    cd "$srcdir/opencode-sandbox"
    install -Dm755 opencode-sandbox "$pkgdir/usr/bin/opencode-sandbox"
    install -Dm755 opencode-project-init "$pkgdir/usr/bin/opencode-project-init"
    install -Dm755 build/opencode-guard "$pkgdir/usr/lib/opencode-sandbox/guard"
}