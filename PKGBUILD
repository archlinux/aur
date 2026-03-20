# Maintainer: Sasha Abbott <sashaa@disroot.org>

pkgname=blahaj-d
_pkgname=BLAHAJ-d
binname=blahaj
pkgver=1.0.2
pkgrel=2
pkgdesc="Gay sharks at your local terminal - ported to D! lolcat-like CLI tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://codeberg.org/sashaa/BLAHAJ-d"
license=('MIT')
depends=()
makedepends=('d-compiler' 'dub')
conflicts=('blahaj' 'blahaj-rs-git' 'blahaj-rs')

source=("git+https://codeberg.org/sashaa/BLAHAJ-d.git#tag=v1.0.2")
sha256sums=('ba7aed6cf912f1ffdf0f706a60c37fccd0ee73d127b5a165d007b0f1301e9f69')

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
