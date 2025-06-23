# Maintainer: mario.valderrama <mv-aur@ransomware.download>
# Maintainer: matthias.lisin <ml-aur@ransomware.download>
# Contributor: Jakob Englisch <jakob.englisch[at]gmail[dot]com>
pkgname=ionosctl-bin
pkgver=6.8.6
pkgrel=1
pkgdesc='IONOS Cloud CLI'
url='https://github.com/ionos-cloud/ionosctl'
arch=('aarch64' 'i686' 'x86_64')
license=('Apache-2.0')
source_aarch64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-arm64.tar.gz")
source_i686=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-386.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/ionosctl-$pkgver-linux-amd64.tar.gz")
sha256sums_aarch64=('9f5b41d597fbca048b5abbff4d56a24a200a6be8fb3bdd5d0ab044f2bbd056f4')
sha256sums_i686=('7c8c6d708dbcaf0905c19bab5be9e64ec17f7c07c7d92ae14bd098273ab5ef3a')
sha256sums_x86_64=('1f99c2569b61cf088e462da6c0574f9c901d9342142a5c07ed381b579222164f')

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
