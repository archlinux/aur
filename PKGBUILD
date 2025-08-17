# Maintainer: Sebastian Kootz - skxxtz@gmail.com
pkgbase="sherlock-launcher" 
pkgname="sherlock-launcher-bin" 
pkgver=0.1.14
pkgrel=3
pkgdesc="Application launcher for Wayland."
arch=('x86_64')
url="https://github.com/skxxtz/sherlock"
license=('custom:CC-BY-NC-4.0')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=()

# Define sources per subpackage
source=("https://github.com/skxxtz/sherlock/releases/download/v${pkgver}-${pkgrel}/sherlock-v${pkgver}-${pkgrel}-bin-linux-x86_64.tar.gz")
sha256sums=('SKIP')

# Prepare source for Git version
prepare() {
    if [[ "$pkgname" == "sherlock-launcher-git" ]]; then
        cd "$srcdir/sherlock"
        git clean -fdx
        git reset --hard HEAD
    fi
}

package() {
    conflicts=("sherlock-launcher-git")
    cd "$srcdir"
    mkdir -p extracted
    tar -xzf "sherlock-v${pkgver}-${pkgrel}-bin-linux-x86_64.tar.gz" -C extracted
    install -Dm755 "extracted/sherlock" "$pkgdir/usr/bin/sherlock"
    install -Dm644 "extracted/LICENSE" "$pkgdir/usr/share/licenses/sherlock-launcher/LICENSE"
}

