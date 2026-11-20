# Maintainer: Lionel Miller <delonorm at gmail dot com>
# Maintainer: Marat Talipov <t-marat.yandex.ru>
# Maintainer: Andrey Kolchenko <andrey@kolchenko.me>

pkgname=kontur-plugin
pkgver=4.15.1.6119
pkgrel=1
pkgdesc='Kontur.Plugin is an extension for web browsers that allows users to perform cryptographic operations in SKB Kontur services.'
arch=('x86_64')
license=('proprietary')
depends=(
    'gtk3'
    'cryptopro-csp-k1'
    'jacartauc'
)
optdepends=('rutoken-connect')
url='https://help.kontur.ru/plugin/'
source=("${pkgname}-${pkgver}.deb::https://install.kontur.ru/files/kontur.plugin_amd64.deb")
sha256sums=('2375f779afd7c1ec64c6b84a78aacf89cb7d68a7ba7a921933e44d1c2b2062f5')

pkgver() {
    bsdtar -xf control.tar.gz
    grep 'Version:' control | cut -d ' ' -f 2
}

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}/"
    mv "${pkgdir}/lib/systemd" "${pkgdir}/usr/lib"
    rm -r "${pkgdir}/usr/lib64/"  # /usr/lib64 is a symlink to /usr/lib
    rm -r "${pkgdir}/lib"
}
