# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.2 # datasource=github-tags depName=astral-sh/ty
pkgver="${pkgver//-/_}"
pkgrel=1
pkgdesc='An extremely fast Python type checker and language server, written in Rust.'
arch=('aarch64' 'armv7' 'i686' 'x86_64')
url='https://github.com/astral-sh/ty'
depends=('glibc' 'gcc-libs')
license=('MIT')
provides=('ty')
conflicts=('ty')

_baseurl="${url}/releases/download/${pkgver//_/-}"

source_aarch64=("ty-aarch64-${pkgver}.tgz::${_baseurl}/ty-aarch64-unknown-linux-gnu.tar.gz")
source_armv7=("ty-armv7-${pkgver}.tgz::${_baseurl}/ty-armv7-unknown-linux-gnueabihf.tar.gz")
source_i686=("ty-i686-${pkgver}.tgz::${_baseurl}/ty-i686-unknown-linux-gnu.tar.gz")
source_x86_64=("ty-x86_64-${pkgver}.tgz::${_baseurl}/ty-x86_64-unknown-linux-gnu.tar.gz")

source=("LICENSE-${pkgver}::${url}/raw/refs/tags/${pkgver//_/-}/LICENSE")

sha256sums=('860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c')
sha256sums_aarch64=('a8a118e865a1d0665c4d6879585a87dc1f07492e8c18a2ba06a76df9f68df1fb')
sha256sums_armv7=('db07591b66e41e6eccf06b0a55246c10124af97ae663aad4a684496bc0ab50ba')
sha256sums_i686=('f5a172650a8de8bd94106e2dde2337d533366e1b5b3dc6c299d9f1c48cc70c74')
sha256sums_x86_64=('ddb248a3b7f4fb99612dff94f76e3ab52e617e4c58dc933bd74b963853ee1902')

package() {

	local target="${pkgdir}/usr/bin/ty"

	install -Dm755 "ty-${CARCH}-unknown-linux-gnu/ty" "$target"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	$target generate-shell-completion bash | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"

	$target generate-shell-completion elvish | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/elvish/lib/$pkgbase.elv"

	$target generate-shell-completion fish | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"

	$target generate-shell-completion zsh | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}
