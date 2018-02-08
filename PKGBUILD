# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname='strichliste-web'
pkgdesc="frontend for the strichliste api"
pkgver=1.6.0
pkgrel=1
arch=('any')
url="https://github.com/hackerspace-bootstrap/strichliste-web"
license=('MIT')
depends=()
optdepends=('ngnix: http server for frontend'
            'strichliste: backend')
makedepends=('npm' 'git')
_html_dir='usr/share/nginx/html/strichliste'
backup=("${_html_dir}/js/settings.js")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hackerspace-bootstrap/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('eb2a0fe07e594cf47c18a03b75afd259ed5026deb029dabf14c2d8e424760e41efe8e3523f8836f503b7af40ce1094199e0ca352960c6b7804e3d0bcf571c5fd')
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
