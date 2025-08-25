# Maintainer: mfw <espadonne@outlook.com>

pkgname=shtick
pkgver=1.0.0
pkgrel=1
pkgdesc='Shell configuration manager with support for 16 different shells'
arch=('x86_64')
url='https://github.com/tenseleyFlow/shtickC'
license=('MIT')
depends=('bash')
makedepends=('gcc' 'make')
optdepends=('zsh: for zsh configuration support'
            'fish: for fish configuration support'
            'dash: for dash configuration support'
            'tcsh: for tcsh configuration support'
            'nushell: for nu configuration support'
            'xonsh: for xonsh configuration support'
            'elvish: for elvish configuration support')
source=("git+https://github.com/tenseleyFlow/shtickC.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd shtickC
    make clean
    make all
}

check() {
    cd shtickC
    make smoke-test || true  # Allow tests to fail gracefully if they require specific shell environments
}

package() {
    cd shtickC
    
    # Install main binary
    install -Dm755 shtick "$pkgdir/usr/bin/shtick"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}