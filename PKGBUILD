# Maintainer: Toni Tauro <eye@eyenx.ch>
# Co-Maintainer: Lukas Grossar <lukasgrossar@gmail.com>

pkgname=k0sctl-bin
pkgver=0.32.1
pkgrel=1
pkgdesc="A bootstrapping and management tool for k0s clusters."
arch=('x86_64')
url="https://github.com/k0sproject/k0sctl"
license=('Apache-2.0')
source=("k0sctl-linux-amd64-$pkgver::https://github.com/k0sproject/k0sctl/releases/download/v${pkgver}/k0sctl-linux-amd64")
sha256sums=('a427299d348f990c90734bea50969249c79c3cab587f880a091fcd1b90f32b65')
options=(!strip)
provides=("k0sctl")
conflicts=("k0sctl")

package() {
	install -Dm 755 "$srcdir/k0sctl-linux-amd64-$pkgver" "$pkgdir/usr/bin/k0sctl"

	"$pkgdir/usr/bin/k0sctl" completion --shell bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/k0sctl"
	"$pkgdir/usr/bin/k0sctl" completion --shell zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_k0sctl"
	"$pkgdir/usr/bin/k0sctl" completion --shell fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/k0sctl.fish"
}
