# Maintainer: Snow Sky
pkgname=gonob
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple AUR helper written in golang"
url="https://github.com/SnowsSky/gonob"
arch=('x86_64')
license=('MIT')
depends=('pacman' 'git' 'fakeroot' 'debugedit' 'curl')
optdepends=('sudo: privilege elevation')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('7a5a5a431aa9141130e5aab420c90b63fbae0088a001929c2507835ee00dc9c8')

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
