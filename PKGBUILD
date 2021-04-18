# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw-bin
_name=${pkgname%-*}
pkgver=1.2.0
pkgrel=3
depends=('pinentry' 'openssl')
conflicts=('rbw-git' 'rbw')
provides=('rbw')
arch=('x86_64')
url="https://git.tozt.net/${_name}"
source=(https://git.tozt.net/rbw/releases/deb/${_name}_${pkgver}_amd64.deb)
sha256sums=('7fe585058f5d4076b562e56f29e90bc0714fb4a425b2f8093b1e0e0f47904e5b')
pkgdesc="unofficial bitwarden cli"
license=('MIT')

package() {
    rm -rf tmp
    mkdir tmp
    tar xf data.tar.xz -C tmp
    install -Dm 755 tmp/usr/bin/rbw -t "${pkgdir}/usr/bin"
    install -Dm 755 tmp/usr/bin/rbw-agent -t "${pkgdir}/usr/bin"
    install -Dm 644 tmp/usr/share/doc/rbw/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 tmp/usr/share/bash-completion/completions/rbw "${pkgdir}/usr/share/bash-completion/completions/rbw"
    install -Dm 644 tmp/usr/share/zsh/vendor-completions/_rbw "${pkgdir}/usr/share/zsh/site-functions/_rbw"
    install -Dm 644 tmp/usr/share/fish/completions/rbw.fish "${pkgdir}/usr/share/fish/vendor_completions.d/rbw.fish"
}
