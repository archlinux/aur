# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.7.3
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('793d346b2a569c35356a4e3198be7bedd905142d9564b7a71a096c066a510a19')
sha256sums_i686=('be53ee40db3f5133eb58ce37cbd2ba9ed675c18a9cbc244f3f4569a8b8665e13')
sha256sums_x86_64=('e2ae536ecb40b9be0cba875709a1093dada49129d1bb6cdf590cdb839a3ce4cb')

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
