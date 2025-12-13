# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.1-alpha.34 # datasource=github-tags depName=astral-sh/ty
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
sha256sums_aarch64=('f6dfc4cf484a2149571455e82ba97477e3271fa428f85b137be731718c158aff')
sha256sums_armv7=('a077a357367b115c7dcffdcb15411ce7c25d133b8378e9a1709cf9de372fea67')
sha256sums_i686=('62ae89953ba8378138f1947a12793332157bead1b4c95eff182878a9fa66424c')
sha256sums_x86_64=('3dcea1c0adf79e72bfd9556d27409d8b84942dcfe9116f0785e3339a9e76752d')

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
