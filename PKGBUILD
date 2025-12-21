# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.5 # datasource=github-tags depName=astral-sh/ty
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
sha256sums_aarch64=('1682b1ebc7e10b9b0fd471eac004800e4fe05ac164c7096ec174d66df5c6c161')
sha256sums_armv7=('3a2e3c533cab4f6a393b3360defb5e057ebae4345b748b94ca7e8ce6fdb7e2d1')
sha256sums_i686=('c3891fde116d7d1568522a65edd7c435a1b1c45a8aa60a0e21b8a6086b1cea86')
sha256sums_x86_64=('5a493ccf4e178e1785258237a51dc1231901c425d997af78e6b59cb228825d70')

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
