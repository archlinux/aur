# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.6.3
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('fc661f6528a1c5327d7b5877da89318b89260b439d839393e85a527e2ae37f42')
sha256sums_i686=('811ec80aa855cd054dfff75838deb63239631fc577e94c92a32a23e97ecb9b5e')
sha256sums_x86_64=('9525e2475dc121ce66372856a31aa1ddecaa79a1b308fb1f5f27807fba1306bc')

build() {
	for i in bash zsh fish; do
		./ionosctl completion "$i" >completion."$i"
	done
}

package() {
	install -Dm755 ionosctl -t "$pkgdir"/usr/bin
	install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/ionosctl
	install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_ionosctl
	install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/ionosctl.fish
	install -dm755 "$pkgdir"/usr/share/doc/ionosctl
	cp -a docs -T "$pkgdir"/usr/share/doc/ionosctl
}
