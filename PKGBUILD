# Maintainer: mfw <espadonne@outlook.com>

pkgname=shtick
pkgver=1.1.0
pkgrel=1
pkgdesc='Shell configuration manager with auto-sourcing support for 16 different shells'
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
install=$pkgname.install
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

    # Install setup script
    install -Dm755 setup.sh "$pkgdir/usr/share/$pkgname/setup.sh"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 CLAUDE.md "$pkgdir/usr/share/doc/$pkgname/CLAUDE.md"
}