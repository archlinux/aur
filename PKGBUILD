# Maintainer: Sasha Abbott <sashaa@disroot.org>

pkgname=blahaj-d
_pkgname=BLAHAJ-d
binname=blahaj
pkgver=1.0.0
pkgrel=1
pkgdesc="Gay sharks at your local terminal - ported to D! lolcat-like CLI tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://codeberg.org/sashaa/BLAHAJ-d"
license=('MIT')
depends=()
makedepends=('d-compiler' 'dub')
conflicts=('blahaj' 'blahaj-rs-git' 'blahaj-rs')

source=("git+https://codeberg.org/sashaa/BLAHAJ-d.git#tag=v1.0.0")
sha256sums=('3822d19e6d10e77434e52443cc34c5b78eeff1df1cc1a6173cc06609a822c585')

build() {
    cd "$_pkgname"
    dub build --build=release
}

package() {
    cd "$_pkgname"
    install -Dm755 "$binname" "$pkgdir/usr/bin/$binname"
    install -Dm644 "completions/bash" "$pkgdir/usr/share/bash-completion/completions/$binname"
    install -Dm644 "completions/zsh" "$pkgdir/usr/share/zsh/site-functions/_$binname"
    install -Dm644 "completions/fish" "$pkgdir/usr/share/fish/vendor_completions.d/$binname.fish"
}
