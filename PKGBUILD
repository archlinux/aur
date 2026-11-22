# Maintainer: steffeno <https://aur.archlinux.org/account/steffeno>

pkgname=tola-bin
_pkgname=tola
pkgver=0.8.2
pkgrel=1
pkgdesc="Typst-based static site generator (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/tola-rs/tola-ssg"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
depends=('glibc' 'libgcc' 'zlib')
options=('!strip' '!debug')
source=("$_pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/tola-rs/tola-ssg/v$pkgver/LICENSE")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('efb41367738efb01c9965212f13325a0ca932aca185c1a29b6f56896efaa8a80')
sha256sums_x86_64=('cae954b7b3fa24e422d0e428e9402bbe01b00c5ad06d9882a692465e248d5432')
sha256sums_aarch64=('67a4cd9ae6d2c7cedd725e44f1785c129474846ae87013a6fa1fe6f53c29d614')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
    install -Dm0644 "$_pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    local _tola="$pkgdir/usr/bin/$_pkgname"
    install -dm0755 \
        "$pkgdir/usr/share/bash-completion/completions" \
        "$pkgdir/usr/share/zsh/site-functions" \
        "$pkgdir/usr/share/fish/vendor_completions.d" \
        "$pkgdir/usr/share/elvish/lib" \
        "$pkgdir/usr/share/man/man1"

    "$_tola" completions bash   > "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    "$_tola" completions zsh    > "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
    "$_tola" completions fish   > "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
    "$_tola" completions elvish > "$pkgdir/usr/share/elvish/lib/$_pkgname.elv"
    "$_tola" manpage --output "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
