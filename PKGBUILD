# Maintainer: David Birks <david@birks.dev>
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=doctl-bin
pkgver=1.45.1
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
url='https://github.com/digitalocean/doctl'
license=('Apache')
arch=('x86_64')
provides=('doctl')
conflicts=('doctl')
source=("https://github.com/digitalocean/doctl/releases/download/v$pkgver/doctl-$pkgver-linux-amd64.tar.gz")
sha512sums=('b756b7084ad285330567c4cc3d962ba8ffdb17c85ac8c65be1f52a42d2f8401627dd4f9f40319a2dc552aa05fe44a41b4ceaf6d8146fe998b07e8b5b0cfa0a0c')

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
