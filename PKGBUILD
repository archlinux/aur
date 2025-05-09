# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.8.3
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache-2.0')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('e18a7d1c03c823138afa85a543ba668504ba9898d3ec0dfdbcec9cb92b2746df')
sha256sums_i686=('63f5aa3314b17c5ca9240925df9d1be86433e2945a1a72015204f83bfa1482bc')
sha256sums_x86_64=('c2f5c793d9177c737c845fa5a7c806a6c8c2b51cf48ea7b225118ed2649d8081')

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
