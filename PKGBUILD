# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname='strichliste-web'
pkgdesc="frontend for the strichliste api"
pkgver=1.7.1
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
sha512sums=('be8b7c8099d84343566ea35bccaf32be6ec87cb126441c666bf9fd2b680e08a79688f24029a6d3013f8e019125a4944362e0f0189d45fec98103c4ed251731fa')
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
