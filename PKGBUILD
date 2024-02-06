# Maintainer: Bwc9876 <bwc9876@gmail.com>
pkgname=owmods-cli-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="A CLI To Manage Outer Wilds Mods"
arch=("x86_64")
url="https://github.com/ow-mods/ow-mod-man/tree/main/owmods_cli"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'mono')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ow-mods/ow-mod-man/releases/download/cli_v$pkgver/owmods.tar.zst")
sha256sums=('726379a63f6651405e9c447805630b7f17887bd5daf02a4d0a111ed90f7955f3')

package() {
    cd "$srcdir/"
    install -Dm755 owmods "${pkgdir}/usr/bin/owmods"

    install -Dm644 "completions/owmods.bash" "${pkgdir}/usr/share/bash-completion/completions/owmods.bash"
    install -Dm644 "completions/owmods.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/owmods.fish"
    install -Dm644 "completions/owmods.zsh" "${pkgdir}/usr/share/zsh/site-functions/_owmods"

    for file in man/*; do
        install -Dm644 "$file" "$pkgdir/usr/share/man/man1/$(basename $file)"
    done
}
