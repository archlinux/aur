# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=jjui-bin
pkgver=0.9.8
pkgrel=1
pkgdesc="Text User Interface (TUI) designed for interacting with the Jujutsu version control system."
arch=("x86_64" "aarch64")
url="https://github.com/idursun/jjui"
license=("MIT")
provides=("jjui")
depends=("jujutsu")
source=(
    "LICENSE-$pkgver::https://raw.githubusercontent.com/idursun/jjui/refs/tags/v${pkgver}/LICENSE"
)
source_x86_64=(
    $pkgname-x86_64-$pkgver::https://github.com/idursun/jjui/releases/download/v${pkgver}/jjui-${pkgver}-linux-amd64.zip
)
source_aarch64=(
    $pkgname-aarch64-$pkgver::https://github.com/idursun/jjui/releases/download/v${pkgver}/jjui-${pkgver}-linux-arm64.zip
)
# checksum generate with 'makepkg -g'
sha256sums=('287dc795228e18d40fe378a70b577d9fd019b638841af5f3d26c1170cb1ed4df')
sha256sums_x86_64=('eef44fc25daa6a9a8506fa5029fc2e49344c6df9e902f7c442f9cf9de6f87be3')
sha256sums_aarch64=('00782bd10e63bff7b3aa75afaf12e7dfd39a399ef774fd4f03a832c7f01c7245')

build() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    if [[ $CARCH == "x86_64" ]]; then
        cp "$srcdir/jjui-$pkgver-linux-amd64" "$srcdir/$pkgname-$pkgver/jjui"
    elif [[ $CARCH == "aarch64" ]]; then
        cp "$srcdir/jjui-$pkgver-linux-arm64" "$srcdir/$pkgname-$pkgver/jjui"
    else
        echo "Unsupported architecture: $CARCH"
        exit 1
    fi
    mv "$srcdir/LICENSE-$pkgver" "$srcdir/$pkgname-$pkgver/LICENSE"
}

package() {
    cd "$srcdir/$pkgname-$pkgver/" || exit
    install -Dm755 jjui "$pkgdir/usr/bin/jjui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
