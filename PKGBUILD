# Maintainer: David Birks <david@tellus.space>

pkgname=doctl-bin
pkgver=1.17.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
options=('strip')
conflicts=('doctl')
source=(https://github.com/digitalocean/doctl/releases/download/v${pkgver}/doctl-${pkgver}-linux-amd64.tar.gz)
sha512sums=('5ac619cbde941952c102099ba3f2a16959d965cdefb15c353ec367c2eede0b6d783fe9c384f37f98fd724df2edd15d5f06810c36d4bf6aad6be6b4adbe27933a')

package() {
    install -Dm 755 "${srcdir}/doctl" "${pkgdir}/usr/bin/doctl"

    # Populate bash and zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "${pkgdir}/usr/bin/doctl" completion bash > "${pkgdir}/usr/share/bash-completion/completions/doctl"
    "${pkgdir}/usr/bin/doctl" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_doctl"
}
