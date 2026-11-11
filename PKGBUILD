# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=openspec-bin
_pkgname=openspec
pkgver=1.17.0 # datasource=github-releases depName=Fission-AI/OpenSpec
pkgrel=1
pkgdesc='Spec-driven development (SDD) for AI coding assistants.'
arch=('aarch64' 'x86_64')
depends=('glibc')
options=('!strip')
url='https://github.com/Fission-AI/OpenSpec'
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname "${_pkgname}-git")

source_aarch64=("openspec-${pkgver}-arm64.tgz::${url}/releases/download/v${pkgver}/openspec-linux-arm64.tar.gz")
source_x86_64=("openspec-${pkgver}-x64.tgz::${url}/releases/download/v${pkgver}/openspec-linux-x64.tar.gz")

sha256sums_aarch64=('c70fc5f9c982caddbbb0e4c9d51739c40879c7f82c26d3f0096d7b8e525e1d20')
sha256sums_x86_64=('eb3dd48f337afe0af23747bd2b7803c185ff53e69994c56da247ec9512234413')

package() {

	local target="$pkgdir/usr/bin/openspec"

	install -Dm755 "openspec" $target
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	$target completion generate bash | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"

	$target completion generate fish | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"

	$target completion generate zsh | \
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}
