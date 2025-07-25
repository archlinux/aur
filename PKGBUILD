# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.9.1
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache-2.0')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('1aaceeff961939d0dd1999f368f90bd3ca7faa5003e35f8664a9e228c4236fc7')
sha256sums_i686=('e3073267d91b4c4d3471e8a7bbed46053d352b37a98c15ce095ea7f241ea069e')
sha256sums_x86_64=('5259549a1d163a902df6ed19c12e19a2c394fd99a0863e5c90884ec9850dbf8a')

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
