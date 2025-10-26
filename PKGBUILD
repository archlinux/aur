# Maintainer: ind4skylivey <https://github.com/ind4skylivey>
pkgname=optiscaler-universal
pkgver=0.1.0
pkgrel=1
pkgdesc="Intelligent OptiScaler configuration tool for Linux gaming - automatically optimizes GPU settings"
arch=('any')
url="https://github.com/ind4skylivey/0ptiscaler4linux"
license=('MIT')
depends=('bash>=4.0' 'pciutils')
optdepends=(
    'mesa-utils: for Mesa/AMD/Intel GPU detection'
    'git-lfs: for downloading OptiScaler binaries'
    'python: for advanced YAML parsing'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fe21d6fef1aeef7f8060e6cd1b8faafa0867d52aad1f5de7e202adf921c388e5')

package() {
    cd "$srcdir/optiscaler-universal-$pkgver"
    
    # Create directories
    install -dm755 "$pkgdir/usr/share/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    
    # Install core files
    cp -r core "$pkgdir/usr/share/$pkgname/"
    cp -r lib "$pkgdir/usr/share/$pkgname/"
    cp -r profiles "$pkgdir/usr/share/$pkgname/"
    cp -r scripts "$pkgdir/usr/share/$pkgname/"
    cp -r templates "$pkgdir/usr/share/$pkgname/"
    
    # Install binaries directory structure
    install -dm755 "$pkgdir/usr/share/$pkgname/binaries"
    cp -r binaries/* "$pkgdir/usr/share/$pkgname/binaries/"
    
    # Create symlinks in /usr/bin
    ln -s "/usr/share/$pkgname/scripts/install.sh" "$pkgdir/usr/bin/optiscaler-install"
    ln -s "/usr/share/$pkgname/scripts/uninstall.sh" "$pkgdir/usr/bin/optiscaler-uninstall"
    ln -s "/usr/share/$pkgname/scripts/update.sh" "$pkgdir/usr/bin/optiscaler-update"
    ln -s "/usr/share/$pkgname/scripts/diagnose.sh" "$pkgdir/usr/bin/optiscaler-diagnose"
    ln -s "/usr/share/$pkgname/scripts/benchmark.sh" "$pkgdir/usr/bin/optiscaler-benchmark"
    
    # Install documentation
    cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 PROJECT_DESIGN.md "$pkgdir/usr/share/doc/$pkgname/PROJECT_DESIGN.md"
    install -Dm644 PROJECT_STATUS.md "$pkgdir/usr/share/doc/$pkgname/PROJECT_STATUS.md"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install version file
    install -Dm644 VERSION "$pkgdir/usr/share/$pkgname/VERSION"
}
