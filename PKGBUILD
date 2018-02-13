# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname='strichliste-web'
pkgdesc="frontend for the strichliste api"
pkgver=1.6.1
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
sha512sums=('91f11557f48ce56fefad81b31b2b7043e10ff7eae7111936b63cfdd6b68736c5fb73faaf2f77f7510cfd81496d688b567efbae0bcf2e2f09e2a10bcdb84709e7')
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
