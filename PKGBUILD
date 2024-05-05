# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=prayermate-id-bin
pkgver=1.1.0
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
source_x86_64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/prayermate-v${pkgver}-linux-amd64.tar.gz")
sha256sums_x86_64=('d5e28da23986f8d7be87e3f1919975d2b9c114a37d0c7d23fc15f2584dd1e516')

source_aarch64=("${pkgname}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/prayermate-v${pkgver}-linux-arm64.tar.gz")
sha256sums_aarch64=('294e53e770af442bc5a67b59f7950f9a2945e1f20debfca9c3a9d9f3d24e1c55')

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
