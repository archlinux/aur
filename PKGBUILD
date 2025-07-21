# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.9.0
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache-2.0')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('b415bffcbfdf7be01c4323fd08c4d43215b63f2b1ef4524eceb2f5344c50fc7b')
sha256sums_i686=('65376ece57511566810e39ea47d1149f4278f56e03c3d9c7c4efabfb4c7949d8')
sha256sums_x86_64=('f72f506b934c3800e44d289ae9d60e301ef3504f9ddb751497c48ca41cc571b9')

build() {
    for i in bash zsh fish; do
        ./ionosctl completion "$i" >completion."$i"
    done
    # -f to avoid prompt if target-dir exists
    ./ionosctl man -f --skip-compression --target-dir "$srcdir"/man1
}

package() {
    install -Dm755 ionosctl -t "$pkgdir"/usr/bin
    install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/ionosctl
    install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_ionosctl
    install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/ionosctl.fish
    install -dm755 "$pkgdir"/usr/share/doc/ionosctl "$pkgdir"/usr/share/man/man1
    cp -a docs -T "$pkgdir"/usr/share/doc/ionosctl
    cp -rvfT "$srcdir"/man1 "$pkgdir"/usr/share/man/man1
}
