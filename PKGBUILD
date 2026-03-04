# Maintainer: Snow Sky
pkgname=gonob
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple AUR helper written in golang"
url="https://github.com/SnowsSky/gonob"
arch=('x86_64')
license=('MIT')
depends=('pacman' 'git' 'fakeroot' 'debugedit' 'curl')
optdepends=('sudo: privilege elevation')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4e02528318995cff64aa7f4a9dc1c9a1a15f88d8ee75dc2c6efe5cdc1d4386d0')

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
