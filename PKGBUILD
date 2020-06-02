# Maintainer: David Birks <david@birks.dev>
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=doctl-bin
pkgver=1.45.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
url='https://github.com/digitalocean/doctl'
license=('Apache')
arch=('x86_64')
provides=('doctl')
conflicts=('doctl')
source=("https://github.com/digitalocean/doctl/releases/download/v$pkgver/doctl-$pkgver-linux-amd64.tar.gz")
sha512sums=('a470b6615f330430f81bfacfc0927c26a934c67f5913493e217fe1862365d52b379d3590d7952c81f19cb573c8c75cdc98414ae95ebf28e50d1c1927cb7b015e')

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
