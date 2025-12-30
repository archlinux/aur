# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.8 # datasource=github-tags depName=astral-sh/ty
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
sha256sums_aarch64=('5ed2758d03a2424f5e451f0b47192616f37ea8b1b3c081c81c7a9bbce3b39174')
sha256sums_armv7=('fe65019250362c87a31b584c9e3073db1234f5c3f9939f9ac5fdc4467c780161')
sha256sums_i686=('4a6cc2643b31f38c721339091a273cf114dc67aac3ecb23f86335c8e99b38409')
sha256sums_ppc64=('ad97783548ee5cce873daffa9e952f061df10b8c4bcaf5c6133bef83ad2060fd')
sha256sums_ppc64le=('f552f8fe5a167b23ee384bac6a7a9b3d73992c3c997dad8274e7f9b7b299043d')
sha256sums_s390x=('b2cf4bb43b07d756e427e8287cb00d22c457887f5ec5a5fc9b0f0463f8ea150b')
sha256sums_x86_64=('0541f70661a724405e2d50e7e9addd38f90e55fd9be4ec804153d6e62797958c')

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
