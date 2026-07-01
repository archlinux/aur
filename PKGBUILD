# Maintainer: quonaro <quonaro@gmail.com>
pkgname=lota-bin
pkgver=1.16.7
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
sha256sums_x86_64=('84908c4a9ccdbd143096cf652415e7dc91f92503fea4161958fca951b74aee54')
sha256sums_aarch64=('67964923fab6c48d6d4c70ad27f31af5a40637a353f01b3fbab7210a4f1872eb')

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
