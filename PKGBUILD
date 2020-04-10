# Maintainer: David Birks <david@birks.dev>
# Contributor: NOGISAKA Sadata <ngsksdt@gmail.com>

pkgname=doctl-bin
pkgver=1.41.0
pkgrel=1
pkgdesc='A command line tool for DigitalOcean services'
url='https://github.com/digitalocean/doctl'
license=('Apache')
arch=('x86_64')
provides=('doctl')
conflicts=('doctl')
source=("https://github.com/digitalocean/doctl/releases/download/v$pkgver/doctl-$pkgver-linux-amd64.tar.gz")
sha512sums=('cdbaaccf0595c52d470cbb880331ce809f923d16cf678d88efac180defed41fbbf5a7b5fd075e156bd1923161946f92e60099ddfcdbbf5eaa1955c5b136bb034')

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
