# Maintainer: ks1686 <ks1686@users.noreply.github.com>
pkgbase=genv
pkgname=genv
pkgver=4.3.2
pkgrel=1
pkgdesc='Track, sync, and reproduce your software environment across Linux, macOS, and WSL2.'
arch=('x86_64' 'aarch64')
url='https://github.com/ks1686/genv'
license=('MIT')
makedepends=('go')
conflicts=('genv-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ks1686/genv/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7b8f182e98a70054188735ddc5db33bc8e95feeccdedc0d962ac53affa22c953')

build() {
	cd "genv-${pkgver}"
	go build -trimpath -ldflags "-s -w -X main.version=${pkgver}" -o genv .
}

package() {
	cd "genv-${pkgver}"
	install -Dm755 genv "${pkgdir}/usr/bin/genv"
	install -Dm644 "completions/genv.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_genv"
	install -Dm644 "completions/genv.bash" "${pkgdir}/usr/share/bash-completion/completions/genv"
	install -Dm644 "completions/genv.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/genv.fish"
}
