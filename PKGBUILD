# Maintainer: quantumvoid0

pkgname=better-control-git
pkgver=0.r57.gd505b13  # Will be updated by pkgver()
pkgrel=1
pkgdesc="A tool to manage system settings easily (git version)"
arch=('any')
url="https://github.com/quantumvoid0/better-control"
license=('GPL')
depends=('python')
makedepends=('git')
provides=('better-control')
conflicts=('better-control')
source=("git+ssh://git@github.com/quantumvoid0/better-control.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/better-control"
    echo "0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/better-control"
    git fetch --all
}

package() {
    cd "$srcdir/better-control"

    # Ensure the src directory exists before accessing it
    if [ -d "src" ]; then
        cd src
    fi

    install -Dm755 control.py "$pkgdir/usr/bin/better-control"
    install -Dm644 control.desktop "$pkgdir/usr/share/applications/better-control.desktop"
}
