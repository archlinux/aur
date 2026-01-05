# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.9 # datasource=github-tags depName=astral-sh/ty
pkgrel=1
pkgdesc='An extremely fast Python type checker and language server, written in Rust.'
arch=('aarch64' 'armv7' 'i686' 'ppc64' 'ppc64le' 's390x' 'x86_64')
url='https://github.com/astral-sh/ty'
depends=('glibc' 'gcc-libs')
license=('MIT')
provides=('ty')
conflicts=('ty')

_baseurl="${url}/releases/download/${pkgver}"

source=("LICENSE-${pkgver}::${url}/raw/refs/tags/${pkgver}/LICENSE")
source_aarch64=("ty-aarch64-${pkgver}.tgz::${_baseurl}/ty-aarch64-unknown-linux-gnu.tar.gz")
source_armv7=("ty-armv7-${pkgver}.tgz::${_baseurl}/ty-armv7-unknown-linux-gnueabihf.tar.gz")
source_i686=("ty-i686-${pkgver}.tgz::${_baseurl}/ty-i686-unknown-linux-gnu.tar.gz")
source_ppc64=("ty-ppc64-${pkgver}.tgz::${_baseurl}/ty-powerpc64-unknown-linux-gnu.tar.gz")
source_ppc64le=("ty-ppc64le-${pkgver}.tgz::${_baseurl}/ty-powerpc64le-unknown-linux-gnu.tar.gz")
source_s390x=("ty-s390x-${pkgver}.tgz::${_baseurl}/ty-s390x-unknown-linux-gnu.tar.gz")
source_x86_64=("ty-x86_64-${pkgver}.tgz::${_baseurl}/ty-x86_64-unknown-linux-gnu.tar.gz")

sha256sums=('860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c')
sha256sums_aarch64=('9a7779c553edbef93f9bee8ba022dfdb1bc1e7922474ca83d1ebbf1d0d6e92f3')
sha256sums_armv7=('eac6a51be17284355d7942770504b6c9ec16ac4f805a00a496acc87f51b8ac67')
sha256sums_i686=('33dbf59e2f57219ccc73f2812aec98d4b16b045846cdcdcfe18aca8f37afb683')
sha256sums_ppc64=('e241e8b2df4f667a50463bb74acae49392aa02af9bab36289440daa94dfded78')
sha256sums_ppc64le=('b93e837355cd94d561468ebf67982bddba5aac37636991cab7074e23b7f250da')
sha256sums_s390x=('7941153ec57d31d9f1d5d60c39b614fa02324271739c28ac2245c14028c7b243')
sha256sums_x86_64=('7c7e23b5767f4cfeb9e6e32fbcea7642b020803ab13ca715385a265e3d0afc0c')

package() {

	local target="${pkgdir}/usr/bin/ty"

	install -Dm755 "$(find $srcdir -name ty)" "$target"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	$target generate-shell-completion bash |
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"

	$target generate-shell-completion elvish |
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/elvish/lib/$pkgbase.elv"

	$target generate-shell-completion fish |
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"

	$target generate-shell-completion zsh |
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}
