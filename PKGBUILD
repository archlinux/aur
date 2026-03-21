# Maintainer: Sasha Abbott <sashaa@disroot.org>

pkgname=blahaj-d
_pkgname=BLAHAJ-d
binname=blahaj
pkgver=1.0.3
pkgrel=2
pkgdesc="Gay sharks at your local terminal - ported to D! lolcat-like CLI tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://codeberg.org/sashaa/BLAHAJ-d"
license=('MIT')
depends=()
makedepends=('d-compiler' 'dub')
conflicts=('blahaj' 'blahaj-rs-git' 'blahaj-rs')

source=("git+https://codeberg.org/sashaa/BLAHAJ-d.git#tag=v1.0.3")
sha256sums=('da4764ad7fedc8455f1dc3cf6130bd234167d591a1772319d6068bf3e859c980')

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
