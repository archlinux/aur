# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=prayermate-id-bin
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="Command line based Muslim prayer reminder - Indonesia"
arch=("x86_64" "aarch64")
url="https://github.com/tfkhdyt/prayermate"
license=('ISC')
depends=()
checkdepends=()
optdepends=()
provides=("prayermate")
conflicts=("prayermate-id")
replaces=()
source_x86_64=("${pkgname}-v${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/prayermate-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('1b823dd0c66eeacbaf63ef6db6cf36ce86c537c0ad5f200b385c8a24db20f287')

source_aarch64=("${pkgname}-v${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/prayermate-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('e717116063fc17c1879f32a8376786401adce0fe9ddc4fd38e9c01036712e83f')

build() {
	./prayermate completion bash >prayermate.bash
	./prayermate completion zsh >_prayermate.zsh
	./prayermate completion fish >prayermate.fish
}

package() {
	install -Dm755 prayermate "$pkgdir/usr/bin/prayermate"
	install -Dm644 prayermate.bash "$pkgdir/usr/share/bash-completion/completions/prayermate"
	install -Dm644 _prayermate.zsh "$pkgdir/usr/share/zsh/site-functions/_prayermate"
	install -Dm644 prayermate.fish "$pkgdir/usr/share/fish/vendor_completions.d/prayermate.fish"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/prayermate-id/LICENSE"
	install -Dm644 prayermate-notify.service "$pkgdir/usr/lib/systemd/user/prayermate-notify.service"
	mkdir -p "$pkgdir/usr/share/prayermate"
	cp -R assets "$pkgdir/usr/share/prayermate"
}
