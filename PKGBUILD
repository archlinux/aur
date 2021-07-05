# Maintainer: Jesse Luehrs <archlinux@tozt.net>
pkgname=rbw-bin
_name=${pkgname%-*}
pkgver=1.3.0
pkgrel=1
depends=('pinentry' 'openssl')
conflicts=('rbw-git' 'rbw')
provides=('rbw')
arch=('x86_64')
url="https://git.tozt.net/${_name}"
source=(https://git.tozt.net/rbw/releases/deb/${_name}_${pkgver}_amd64.deb)
sha256sums=('f1b02d4e3075b71d80a8ca91f7eb61769387afef548ceeced500d93310433d13')
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
