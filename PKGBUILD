# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.6.8
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('ad15f9f5f89c362e5860de438bad6b6025684bc4d2b7f5fe1faef7e1fb67bacc')
sha256sums_i686=('bb80a4818aaa4c3f3f6ba0926617d6f4686b6acb436953288d0a84822488be92')
sha256sums_x86_64=('782af476e1e6cb400e7779d5b5c7f5d9a24f4185f7e7697d7fafa39dad815ed9')

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
