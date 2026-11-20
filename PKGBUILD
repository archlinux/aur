# Maintainer: Patrick Bergner <aur-contact@rldn.de>
pkgname=setdown-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Convert Markdown to typographically high-quality PDFs with an embedded Typst'
arch=('x86_64' 'aarch64')
url='https://github.com/patrickbergner/setdown'
# setdown's own license, then those of what the binary embeds: Typst, the fonts and cmarker, and Go and its modules
license=('MIT' 'Apache-2.0' 'OFL-1.1' 'BSD-3-Clause')
provides=("setdown=$pkgver")
conflicts=('setdown')
# The release binaries are already stripped (-s -w); install them unchanged
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/setdown-$pkgver-linux-amd64.zip")
source_aarch64=("$url/releases/download/v$pkgver/setdown-$pkgver-linux-arm64.zip")
sha256sums_x86_64=('62bf586fb7dceddef113ace112036afbd9a970653d802c28ee3ebdd7bea98aa5')
sha256sums_aarch64=('1052a2236ad7546d2b95950e0b8f24d76f32484cc184e8400a164ad673679411')

package() {
    cd "setdown-$pkgver"
    install -Dm755 setdown -t "$pkgdir/usr/bin"
    install -Dm644 readme.txt -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    # The zip holds only setdown's own license; the binary carries the texts of what it embeds and prints them
    ./setdown --licenses >"$pkgdir/usr/share/licenses/$pkgname/licenses.txt"
}
