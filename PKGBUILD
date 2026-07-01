# Maintainer: quonaro <quonaro@gmail.com>
pkgname=lota-bin
pkgver=1.16.12
pkgrel=1
pkgdesc="A configurable task runner for rapid development (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/quonaro/lota"
license=('Apache-2.0')
depends=('glibc')
provides=('lota')
conflicts=('lota')

source_x86_64=("$pkgname-$pkgver::https://github.com/quonaro/Lota/releases/download/v$pkgver/lota-linux-amd64")
source_aarch64=("$pkgname-$pkgver::https://github.com/quonaro/Lota/releases/download/v$pkgver/lota-linux-arm64")
sha256sums_x86_64=('c822279784c004baa499d6c16015a3960f62f5aac7a7da9ae2fff44bec663441')
sha256sums_aarch64=('2a642ef9d1081e13454b8e106dea4c99de74f6c01e0fadd4c902719444f6c7d4')

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
