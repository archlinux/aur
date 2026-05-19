# Maintainer: quonaro <quonaro@gmail.com>
pkgname=lota-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="A declarative task runner for rapid development (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/quonaro/lota"
license=('Apache-2.0')
depends=('glibc')
provides=('lota')
conflicts=('lota')

source_x86_64=("$pkgname-$pkgver::https://github.com/quonaro/Lota/releases/download/v$pkgver/lota-linux-amd64")
source_aarch64=("$pkgname-$pkgver::https://github.com/quonaro/Lota/releases/download/v$pkgver/lota-linux-arm64")
sha256sums_x86_64=('1f684b72d87498d244e6744f6fc2d3930b979c3579d4fb4eceefd0ee6a49ced1')
sha256sums_aarch64=('90ddbfa8228fa85982626aa8c852fe208d8d338bb67ef6fed97aade5b5007f44')

build() {
    chmod +x "$pkgname-$pkgver"
    ./"$pkgname-$pkgver" --completion-script bash > bash-completion
    ./"$pkgname-$pkgver" --completion-script zsh > zsh-completion
    ./"$pkgname-$pkgver" --completion-script fish > fish-completion
}

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/lota"
    install -Dm644 bash-completion "$pkgdir/usr/share/bash-completion/completions/lota"
    install -Dm644 zsh-completion "$pkgdir/usr/share/zsh/site-functions/_lota"
    install -Dm644 fish-completion "$pkgdir/usr/share/fish/vendor_completions.d/lota.fish"
}
