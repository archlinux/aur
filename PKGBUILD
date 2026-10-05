# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr-bin
_pkgname=whatevr
pkgver=0.9.1
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (prebuilt whatevrd daemon + whattui terminal frontend)"
arch=('x86_64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('glibc' 'libjpeg-turbo')
optdepends=('ffmpeg: video posters and voice note waveforms')
provides=('whatevr' 'whatevrd' 'whattui')
conflicts=('whatevr' 'whatevr-git')
install="$_pkgname.install"
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.zst")
sha256sums_x86_64=('140cdd54e727e4e9ae99ed5a16ec4740c4943c13a6cb14a0aa1ac13a258b9c9e')

package() {
	local root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"

	cp -a "$root/usr" "$pkgdir/"
	install -Dm644 "$root/usr/share/licenses/$_pkgname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	local completions="$pkgdir/usr/share"
	install -d "$completions/bash-completion/completions" "$completions/zsh/site-functions" "$completions/fish/vendor_completions.d"
	"$pkgdir/usr/bin/whatevrd" completion bash >"$completions/bash-completion/completions/whatevrd"
	"$pkgdir/usr/bin/whatevrd" completion zsh >"$completions/zsh/site-functions/_whatevrd"
	"$pkgdir/usr/bin/whatevrd" completion fish >"$completions/fish/vendor_completions.d/whatevrd.fish"
}
