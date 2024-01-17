# Maintainer: Latif Sulistyo <latipun@aur.archlinux.org>

# shellcheck disable=2034,2154
# shellcheck shell=bash

pkgname=charasay-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="The future of cowsay 🐮! Colorful characters saying something 🗨️."
arch=("x86_64" "aarch64")
url="https://github.com/latipun7/charasay"
license=("MIT")
conflicts=("charasay")
provides=("charasay")
source_x86_64=("$pkgname-$pkgver-x86_64.zip::$url/releases/download/v$pkgver/chara-x86_64-unknown-linux-gnu.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.zip::$url/releases/download/v$pkgver/chara-aarch64-unknown-linux-gnu.zip")
sha256sums_x86_64=('bd91bcc8ff2cbdae3caa5b76adf93ac2a14c0e240a063a63618703f8da934835')
sha256sums_aarch64=('3709d0d7650acc7d3ac05fbb3287fdb1906c5ce97b703e7cdf8ee366115ac080')

build() {
	cd "$srcdir" || exit 1

	# generate completions
	./chara completions --shell zsh >"$srcdir/_chara"
	./chara completions --shell bash >"$srcdir/chara.bash"
	./chara completions --shell fish >"$srcdir/chara.fish"
}

package() {
	cd "$srcdir" || exit 1

	install -Dm755 chara "${pkgdir}/usr/bin/chara"

	install -Dm644 _chara "${pkgdir}/usr/share/zsh/site-functions/_chara"
	install -Dm644 chara.bash "${pkgdir}/usr/share/bash-completion/completions/chara.bash"
	install -Dm644 chara.fish "${pkgdir}/usr/share/fish/vendor_completions.d/chara.fish"
}
