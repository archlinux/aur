# Maintainer: Arunachalam <arunachalam.gojosaturo@gmail.com>
# LUNA CLI - Node.js version

pkgname=luna-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="Luna CLI - Modern TUI in Ink (Original Node.js Build)"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/Luna-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'typescript')
source=("https://github.com/Arunachalam-gojosaturo/Luna-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1810e6248b74fdcef88b0d5762765816f61507bd4125edc5da9da534c0233276')

build() {
    cd "Luna-cli-${pkgver}"
    npm install
    npm run build
    npm pack
}

package() {
    cd "Luna-cli-${pkgver}"
    npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" *.tgz
    
    # Change ownership to root
    chown -R root:root "$pkgdir" || true
    
    # Remove npm cache if it was created inside pkgdir
    rm -rf "$pkgdir/usr/etc"
}
