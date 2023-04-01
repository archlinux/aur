# Maintainer: ml <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.6.1
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('8a1c3bb06f4c350427a20e617e022e8e0a429ac059642ee665996457ae4b775a')
sha256sums_i686=('27685662ec416b77a58a8514d4eee274f39e26701482f74c3e253cd88c341bb9')
sha256sums_x86_64=('f273996658b5ffda4aac7a32537bf17609a4e076594f221af03fec58bfcaed53')

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
