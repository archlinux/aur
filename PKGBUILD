# Maintainer: 1dylan1 dylan@whati.me 
pkgname=cmdr
pkgver=1.0.0
pkgrel=1
pkgdesc="An easily configurable command-line tool for accessing Source RCON servers."
arch=('x86_64')
url="https://github.com/1dylan1/cmdr"
license=('MIT')
depends=()
makedepends=('go')
source=("https://github.com/1dylan1/cmdr/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('07ad2a8584a51fb5afe3f8b9eda07249f43d7c5606d0834f55c7fa3f28ce0813')

build() {
    cd "$srcdir/cmdr-"*
    go build -o cmdr . 
}

package() {
    cd "$srcdir/cmdr-"*
    install -Dm755 cmdr "$pkgdir/usr/bin/cmdr"  
    install -Dm644 config.yaml.example "$pkgdir/usr/share/cmdr/config.yaml"  
}

post_install() {
    echo
    echo "------------------------------------------------------------"
    echo "  A default example config file has been installed to /usr/share/cmdr/config.yaml."
    echo "  To use cmdr, copy it to your user config folder:"
    echo "  mkdir -p \$HOME/.config/cmdr"
    echo "  cp /usr/share/cmdr/config.yaml \$HOME/.config/cmdr/config.yaml"
    echo "------------------------------------------------------------"
    echo
}

