# Maintainer: David Birks <david@tellus.space>

pkgname=doctl-bin
pkgver=1.16.0
pkgrel=1
pkgdesc="A command line tool for DigitalOcean services"
url="https://github.com/digitalocean/doctl"
license=('Apache')
arch=('x86_64')
options=('strip')
conflicts=('doctl')
source=(https://github.com/digitalocean/doctl/releases/download/v${pkgver}/doctl-${pkgver}-linux-amd64.tar.gz)
sha512sums=('998f10f3a82f9c206d22b291d55213277a18068d1c2c1092f0eb9ce8f1cee3af7784c19070e907d0f6ed69aff0190438c285710d6487947b3863485859762f35')

package() {
    install -Dm 755 "${srcdir}/doctl" "${pkgdir}/usr/bin/doctl"

    # Populate bash and zsh completions
    install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
    "${pkgdir}/usr/bin/doctl" completion bash > "${pkgdir}/usr/share/bash-completion/completions/doctl"
    "${pkgdir}/usr/bin/doctl" completion zsh >  "${pkgdir}/usr/share/zsh/site-functions/_doctl"
}
