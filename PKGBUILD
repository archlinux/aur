# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=jjui-bin
pkgver=0.10.0
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
sha256sums_x86_64=('8820aeea2540e32a645bd04c339cbc9f0ff8db5c88c63088b5fd201508627ca8')
sha256sums_aarch64=('d1bc44c392f730aca337c8c6536c92fab1f9c233e04f26e66ca9e94ba752be8e')

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
