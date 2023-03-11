# Maintainer: ml <>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.5.2
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
source_x86_64=("https://github.com/ionos-cloud/ionosctl/releases/download/v${pkgver}/ionosctl-$pkgver-linux-amd64.tar.gz")
source_aarch64=("https://github.com/ionos-cloud/ionosctl/releases/download/v${pkgver}/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("https://github.com/ionos-cloud/ionosctl/releases/download/v${pkgver}/ionosctl-$pkgver-linux-386.tar.gz")
sha256sums_aarch64=('ca24aa924f3309c969eb4dcd576929305e362763d7201211d7a3086418baf7e9')
sha256sums_i686=('c08f67c380eee3319e44efa2e6cea9b68fc4ec02dc52b50c689a11e701f852e6')
sha256sums_x86_64=('211f043b428b12ad56ef188345972bbaaf202d02b07b01f339858029e013afca')

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
