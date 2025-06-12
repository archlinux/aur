# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.1_alpha.9
pkgrel=2
pkgdesc='An extremely fast Python type checker and language server, written in Rust.'
arch=('aarch64' 'armv7' 'i686' 'x86_64')
url='https://github.com/astral-sh/ty'
depends=('glibc' 'gcc-libs')
license=('MIT')
provides=('ty')

_baseurl="https://github.com/astral-sh/ty/releases/download/${pkgver//_/-}"

source_aarch64=("${_baseurl}/ty-aarch64-unknown-linux-gnu.tar.gz")
source_armv7=("${_baseurl}/ty-armv7-unknown-linux-gnueabihf.tar.gz")
source_i686=("${_baseurl}/ty-i686-unknown-linux-gnu.tar.gz")
source_x86_64=("${_baseurl}/ty-x86_64-unknown-linux-gnu.tar.gz")

source=('https://raw.githubusercontent.com/astral-sh/ty/refs/heads/main/LICENSE')

sha256sums=('860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c')
sha256sums_aarch64=('88c25527cacd84b09c87fbf856a1e0352467b1297322bf75d22c7c5b24f249d7')
sha256sums_armv7=('64b4eb37508686fcbc740ef3f7897668b8b854a040a239dc4f8cb38135bc9228')
sha256sums_i686=('58d9b1b56d1aef8d37f4b86b507a6cb2449b907be00d3a043cf3b9f1031e87f6')
sha256sums_x86_64=('02bcf0c95c794b254cac68f34e16e20b2d16bedf8510769f8c035559d1333ec8')


package() {

	local target="${pkgdir}/usr/bin/ty"

	install -Dm755 "ty-${CARCH}-unknown-linux-gnu/ty" "$target"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	$target generate-shell-completion bash | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"

	$target generate-shell-completion elvish | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/elvish/lib/$pkgbase.elv"

	$target generate-shell-completion fish | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"

	$target generate-shell-completion zsh | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}
