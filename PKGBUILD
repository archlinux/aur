# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=openspec-bin
_pkgname=openspec
pkgver=2.0.0 # datasource=github-releases depName=Fission-AI/OpenSpec
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

sha256sums_aarch64=('c3f8313663f0a9ffe41c4df274b22398810f8685189713068ec80e574a325f5b')
sha256sums_x86_64=('de16fddbce121ee176e74c963a31dc723e851629a3b89a78bd16e360d34dcf4c')

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
