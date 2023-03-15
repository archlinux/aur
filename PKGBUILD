# Maintainer: ml <>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.6.0
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache')
source_x86_64=("https://github.com/ionos-cloud/ionosctl/releases/download/v${pkgver}/ionosctl-$pkgver-linux-amd64.tar.gz")
source_aarch64=("https://github.com/ionos-cloud/ionosctl/releases/download/v${pkgver}/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("https://github.com/ionos-cloud/ionosctl/releases/download/v${pkgver}/ionosctl-$pkgver-linux-386.tar.gz")
sha256sums_aarch64=('0fd3e3eaa05edb4a5edc7a0b41a18137a89bc677cc72913b5d6cc4eac7e92d97')
sha256sums_i686=('f8db2361c0a387446c4fbbd74eee4091c9288e9e532a98a643dab409ee0cc39f')
sha256sums_x86_64=('395eb03c1438d57b719831e1b8c4a1e7921884987cce5c15a7c46aa181c8834c')

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
