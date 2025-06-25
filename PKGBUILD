# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.1-alpha.12 # datasource=github-releases depName=astral-sh/ty
pkgver="${pkgver//-/_}"
pkgrel=1
pkgdesc='An extremely fast Python type checker and language server, written in Rust.'
arch=('aarch64' 'armv7' 'i686' 'x86_64')
url='https://github.com/astral-sh/ty'
depends=('glibc' 'gcc-libs')
license=('MIT')
provides=('ty')
conflicts=('ty')

_baseurl="https://github.com/astral-sh/ty/releases/download/${pkgver//_/-}"

source_aarch64=("ty-aarch64-${pkgver}.tgz::${_baseurl}/ty-aarch64-unknown-linux-gnu.tar.gz")
source_armv7=("ty-armv7-${pkgver}.tgz::${_baseurl}/ty-armv7-unknown-linux-gnueabihf.tar.gz")
source_i686=("ty-i686-${pkgver}.tgz::${_baseurl}/ty-i686-unknown-linux-gnu.tar.gz")
source_x86_64=("ty-x86_64-${pkgver}.tgz::${_baseurl}/ty-x86_64-unknown-linux-gnu.tar.gz")

source=("https://raw.githubusercontent.com/astral-sh/ty/refs/tags/${pkgver//_/-}/LICENSE")

sha256sums=('860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c')
sha256sums_aarch64=('324a2cc372c6af4ad7442e9aab5c11c4bd58a0768fdf1e4ffde7573d856c809c')
sha256sums_armv7=('5a906ec1a64b7458035ebf4bdc4ffcfe04b0f24ca4a7599365cc1d16d8d632b2')
sha256sums_i686=('a13a7cbb6b037ec0aea2d009fb75811c31c2ab752345084ffe53389c0430355e')
sha256sums_x86_64=('a5af2dab8e54d0cb7f27c79b8181e18e085f4eaa33a8d7ec51953bca5c11d6f2')

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
