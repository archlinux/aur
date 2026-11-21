# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=openspec-bin
_pkgname=openspec
pkgver=2.1.1 # datasource=github-releases depName=Fission-AI/OpenSpec
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

sha256sums_aarch64=('b7ab16e4138e88df2d2ddc13e687bf20f6fe22751db68492d48e00d77b0183da')
sha256sums_x86_64=('22f0c7c96cc14138becb42aa98e589050c94cda793cbefd7e7ac2d7dee78b6d5')

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
