# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.9.5
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache-2.0')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('5a45236fd7cc96b33cff97399d511deb1daaf3375ad5cbf2d72104df2e7e757c')
sha256sums_i686=('bdd9d6f312bb9ce971c40ba0a0ec2a7de6a5fa4edb4350e9175aa7d3bbd18e96')
sha256sums_x86_64=('f40f6185ab292917d2637ec0060ce0f68a0718b110bfb85b2ad3bc133966783b')

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
