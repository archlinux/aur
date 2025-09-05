# Maintainer: Eswar & Shyam <packagesaur@gmail.com>
pkgname=brainrot-battery
pkgver=1.0.0
pkgrel=1
pkgdesc="BrainRot Battery Monitor. A package which helps you to monitor your battery details in real time"
arch=('any')
url="https://github.com/packagesaur-alt/BrainRot_Battery"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/packagesaur-alt/BrainRot_Battery/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0340440d3823782c84fd8a5dbc4d879b4fb236ee18361e0e423ac669e0d4be6c')

build() {
    cd "BrainRot_Battery-$pkgver"
    cargo build --release
}

check() {
    cd "BrainRot_Battery-$pkgver"
    cargo test --release
}

package() {
    cd "BrainRot_Battery-$pkgver"
    
    # Install binary (use the actual compiled name)
    install -Dm755 "target/release/batfi" "$pkgdir/usr/bin/brainrot-battery"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install man page if it exists
    if [ -f "BrainRot_Battery.1" ]; then
        install -Dm644 "BrainRot_Battery.1" "$pkgdir/usr/share/man/man1/brainrot-battery.1"
    fi
}

