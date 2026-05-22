# Maintainer: Snow Sky
pkgname=gonob
pkgver=2.4.0
pkgrel=1
pkgdesc="A simple AUR helper written in golang"
url="https://github.com/SnowsSky/gonob"
arch=('x86_64')
license=('MIT')
depends=('pacman' 'git' 'fakeroot' 'debugedit' 'curl')
optdepends=('sudo: privilege elevation')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ea80c32ba8cce365e27e20ff2327e15be79d79248dbb5d15763b9fd34eb88305')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    go build -o gonob .
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install binary
    install -Dm755 gonob "$pkgdir/usr/bin/gonob"

    # Install translations
    install -d "$pkgdir/etc/gonob/translations"
    for file in translations/*.json; do
        install -m644 "$file" "$pkgdir/etc/gonob/translations/"
    done

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
