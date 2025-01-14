# Maintainer: Sebastian Kootz - skxxtz@gmail.com

pkgbase='sherlock-launcher'
pkgname=('sherlock-launcher-git'
         'sherlock-launcher-bin')
pkgver=0.1.0
pkgrel=1
pkgdesc="Application launcher for Wayland."
arch=('x86_64')
url="https://github.com/skxxtz/sherlock"
license=('custom:CC-BY-NC-4.0')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'rust')

# Define sources and checksums for both bin and git versions
source=(
    "git+https://github.com/skxxtz/sherlock.git"
    "https://github.com/skxxtz/sherlock/releases/download/v${pkgver}/sherlock-v${pkgver}-bin-linux-x86_64.tar.gz"
)

sha256sums=('SKIP' 
            'SKIP') 

# Build function for Git version
build() {
    if [[ "$pkgname" == "sherlock-launcher-git" ]]; then
        cd "$srcdir/sherlock"
        cargo build --release
    fi
}

# Post-installation hook for# Install function for both packages
package_sherlock-launcher-git() {
    conflicts=("sherlock-launcher-bin")
    cd "$srcdir"
    install -Dm755 target/release/sherlock "$pkgdir/usr/bin/sherlock"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/sherlock-launcher/LICENSE"
}

package_sherlock-launcher-bin() {
    conflicts=("sherlock-launcher-git")
    cd "$srcdir"
    tar -xzf "$srcdir/sherlock-v${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"

    install -Dm644 "$pkgdir/LICENSE" "$pkgdir/usr/share/licenses/sherlock-launcher/LICENSE"
    install -Dm755 "$pkgdir/sherlock" "$pkgdir/usr/bin/sherlock"
}

post_install() {
    if [[ "$pkgname" == "sherlock-launcher-git" ]]; then
        echo "Installing Sherlock Launcher (Git version)."
    fi

    if [[ "$pkgname" == "sherlock-launcher-bin" ]]; then
        echo "Installing Sherlock Launcher (Binary version)."
    fi
}

# Post-upgrade hook for both versions
post_upgrade() {
    if [[ "$pkgname" == "sherlock-launcher-git" ]]; then
        echo "Upgrading Sherlock Launcher (Git version)."
    fi

    if [[ "$pkgname" == "sherlock-launcher-bin" ]]; then
        echo "Upgrading Sherlock Launcher (Binary version)."
    fi
}

# Post-removal hook for both versions
post_remove() {
    if [[ "$pkgname" == "sherlock-launcher-git" ]]; then
        echo "Removing Sherlock Launcher (Git version)."
    fi

    if [[ "$pkgname" == "sherlock-launcher-bin" ]]; then
        echo "Removing Sherlock Launcher (Binary version)."
    fi
}

