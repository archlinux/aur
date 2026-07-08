# Maintainer: quonaro <quonaro@gmail.com>
pkgname=lota-bin
pkgver=1.17.7
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
sha256sums_x86_64=('847574eb73a5c479edd5a4374e7dfced6c3fde7671eaf6c0da8e2821be552786')
sha256sums_aarch64=('d82dcf9eeea3d00082ca44a15edea5050e7375e9c6b416951555c2679024370c')

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
