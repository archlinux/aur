# Maintainer: David Birks <david@birks.dev>
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=doctl-bin
pkgver=1.43.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
url='https://github.com/digitalocean/doctl'
license=('Apache')
arch=('x86_64')
provides=('doctl')
conflicts=('doctl')
source=("https://github.com/digitalocean/doctl/releases/download/v$pkgver/doctl-$pkgver-linux-amd64.tar.gz")
sha512sums=('31708c389be9fe62839acf0616359fb4231ec770a379b8ce227fcfd9dcf5eb9f2172db6bd93ea9e225203b10f4b851835829349c06c440a086eaf079231a5d7b')

package() {
    install -Dm 755 "$srcdir/doctl" "$pkgdir/usr/bin/doctl"

    # Populate bash, zsh, and fish completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm 755 "$pkgdir/usr/share/fish/completions"
    "$pkgdir/usr/bin/doctl" completion bash > "$pkgdir/usr/share/bash-completion/completions/doctl"
    "$pkgdir/usr/bin/doctl" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_doctl"
    "$pkgdir/usr/bin/doctl" completion fish > "$pkgdir/usr/share/fish/completions/doctl.fish"
}
