# Maintainer: edaywalid <becharwalid9@gmail.com>
# Binary release of undo (https://github.com/edaywalid/undo).
# Named undo-cli because the AUR name undo-bin is occupied by an
# unrelated project that also provides "undo".
pkgname=undo-cli-bin
_pkgname=undo
pkgver=0.2.6
pkgrel=1
pkgdesc="Revert what the last shell command did to the filesystem"
arch=('x86_64' 'aarch64')
url="https://github.com/edaywalid/undo"
license=('MIT')
depends=('glibc')
optdepends=('zsh: zsh hook' 'bash: bash hook' 'fish: fish hook')
provides=('undo-cli')
conflicts=('undo-cli')
source_x86_64=("$url/releases/download/v$pkgver/undo_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/undo_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a4ea8d2def1f21c04706da0f2abf47d7db2cb9d058d0cea1fb4057f13268f7ec')
sha256sums_aarch64=('1ba52c74281baf6986017bbd998b00255296e299dde2665fc2b434d6134f4dcb')

package() {
    case "$CARCH" in
        x86_64) _arch=amd64 ;;
        aarch64) _arch=arm64 ;;
    esac
    install -Dm755 "$srcdir/undo" "$pkgdir/usr/bin/undo"
    install -Dm755 "$srcdir/build/libundo_${_arch}.so" "$pkgdir/usr/lib/undo/libundo.so"
    install -Dm644 "$srcdir/shell/undo.zsh" "$pkgdir/usr/share/undo/undo.zsh"
    install -Dm644 "$srcdir/shell/undo.bash" "$pkgdir/usr/share/undo/undo.bash"
    install -Dm644 "$srcdir/shell/undo.fish" "$pkgdir/usr/share/undo/undo.fish"
    install -Dm644 "$srcdir/completions/_undo" "$pkgdir/usr/share/zsh/site-functions/_undo"
    install -Dm644 "$srcdir/completions/undo.bash" "$pkgdir/usr/share/bash-completion/completions/undo"
    install -Dm644 "$srcdir/completions/undo.fish" "$pkgdir/usr/share/fish/vendor_completions.d/undo.fish"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
