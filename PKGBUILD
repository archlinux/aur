# Maintainer: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=prayermate-id
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Command line based Muslim prayer reminder - Indonesia"
arch=("x86_64")
url="https://codeberg.org/tfkhdyt/prayermate"
license=('ISC')
depends=("glibc")
makedepends=('go')
checkdepends=()
optdepends=()
provides=("prayermate")
conflicts=()
replaces=()
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/tfkhdyt/prayermate/archive/v$pkgver.tar.gz")
md5sums=("SKIP")

build() {
	cd prayermate
	go build -buildvcs=false -o prayermate .
	./prayermate completion bash > prayermate.bash
	./prayermate completion zsh > _prayermate.zsh
	./prayermate completion fish > prayermate.fish
}

package() {
	cd prayermate
	install -Dm755 prayermate "$pkgdir/usr/bin/prayermate"
	install -Dm644 prayermate.bash "$pkgdir/usr/share/bash-completion/completions/prayermate"
	install -Dm644 _prayermate.zsh "$pkgdir/usr/share/zsh/site-functions/_prayermate"
	install -Dm644 prayermate.fish "$pkgdir/usr/share/fish/vendor_completions.d/prayermate.fish"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/prayermate-id/LICENSE"
  mkdir -p "$pkgdir/usr/share/prayermate"
	cp -R assets "$pkgdir/usr/share/prayermate"
}
