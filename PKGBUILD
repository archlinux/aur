# Maintainer: quonaro <quonaro@gmail.com>
pkgname=lota-bin
pkgver=1.13.2
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
sha256sums_x86_64=('648d22d98d566399a5354241aabb8eb4c67c76b7b074dd55d633a77b9918afea')
sha256sums_aarch64=('8a3998994fdbf44c5a8569f48e38e1ac3985f6703248666fc7885e6ce4141acb')

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
