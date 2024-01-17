# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.7.4
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache-2.0')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('9170d1e79fb1eeb11b723e682efd9850d82cab25f9adc602cc42abb66bb78e0d')
sha256sums_i686=('2413ab12201eb8eb26c02babb60fa3662914ea6fddb5aae2f98e91b0ecdd44a2')
sha256sums_x86_64=('1ea81266cc652b5de77569459f6bc2530c91a3bfef7338db9d22403f38b5d83f')

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
