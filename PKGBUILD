# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.1-alpha.28 # datasource=github-tags depName=astral-sh/ty
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
sha256sums_aarch64=('cddb4a0e6ecef43b3e49d411d192782a1b4d488b65dc4d1d99c0972f7f8f81fb')
sha256sums_armv7=('b659eb93450f5d58ec3254ec9bf8fa63f133dc1947615854dee8e682dbcf8baa')
sha256sums_i686=('ab62629adf90a287cdfacfc400c61109803d785ee87b60509cf4dca45f0b734d')
sha256sums_x86_64=('9385a3070f308b71352f27c0588fe463ab27f84c8827aa1e43a78639caab4207')

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
