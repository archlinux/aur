# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname='strichliste-web'
pkgdesc="frontend for the strichliste api"
pkgver=1.7.2
pkgrel=1
arch=('any')
url="https://github.com/hackerspace-bootstrap/strichliste-web"
license=('MIT')
depends=()
optdepends=('nginx: http server for frontend'
            'strichliste: backend')
makedepends=('npm' 'git')
_html_dir='usr/share/nginx/html/strichliste'
backup=("${_html_dir}/js/settings.js")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hackerspace-bootstrap/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('0471659b0c45fda1223e1723ac403ac5ce74c5e6308c890d71bda93dd56e5088e417ce5d82c8583069fbeba25288c5e3f91bcfe4ecdce39b281efa885381125d')
validpgpkeys=('') # TODO

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make production
    mkdir -p "${pkgdir}/${_html_dir}"
    cp -a strichliste-web/. "${pkgdir}/${_html_dir}"

    # Install license
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Fix npm derp
    find "${pkgdir}/usr" -type d -exec chmod 755 '{}' +
}
