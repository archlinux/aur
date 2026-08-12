# Maintainer: ks1686 <ks1686@users.noreply.github.com>
pkgbase=genv
pkgname=genv
pkgver=4.0.10
pkgrel=1
pkgdesc='Track, sync, and reproduce your software environment across Linux, macOS, and WSL2.'
arch=('x86_64' 'aarch64')
url='https://github.com/ks1686/genv'
license=('MIT')
makedepends=('go')
conflicts=('genv-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ks1686/genv/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a1f8da5c03141fb11a70e6d045643c89a069d548ed5678e85a09fa2fda0cd9e')

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
