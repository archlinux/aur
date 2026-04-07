# Maintainer: Snow Sky
pkgname=gonob
pkgver=2.3.1
pkgrel=1
pkgdesc="A simple AUR helper written in golang"
url="https://github.com/SnowsSky/gonob"
arch=('x86_64')
license=('MIT')
depends=('pacman' 'git' 'fakeroot' 'debugedit' 'curl')
optdepends=('sudo: privilege elevation')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e9952d7237f5bf27d39295452f16037d83ea1756ba81039ed2ab64b99dcb85fa')

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
