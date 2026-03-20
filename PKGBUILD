# Maintainer: Sasha Abbott <sashaa@disroot.org>

pkgname=blahaj-d
_pkgname=BLAHAJ-d
binname=blahaj
pkgver=1.0.2
pkgrel=1
pkgdesc="Gay sharks at your local terminal - ported to D! lolcat-like CLI tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://codeberg.org/sashaa/BLAHAJ-d"
license=('MIT')
depends=()
makedepends=('d-compiler' 'dub')
conflicts=('blahaj' 'blahaj-rs-git' 'blahaj-rs')

source=("git+https://codeberg.org/sashaa/BLAHAJ-d.git#tag=v1.0.2")
sha256sums=('23d43a300caaccadce2235af05fad8589b44184cd535ae0972f3b9d8db15fa63')

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
