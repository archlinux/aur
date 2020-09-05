# Maintainer: Carlos Galindo <carlos.s.galindo (at) gmail.com>
pkgname=meshcentral
pkgver=0.5.13
pkgrel=1
pkgdesc="dmenu adapter for bitwarden-cli"
arch=('x86_64')
url="https://github.com/Ylianst/MeshCentral"
license=('Apache')
depends=('nodejs')
makedepends=('npm')
backup=('etc/meshcentral/config.json')
noextract=("$pkgname-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/MeshCentral_v$pkgver.tar.gz")
sha512sums=('e116241065834a25e56d8ced726ce978c50c876c56a916c8b0ecd211217cf4465c3b29d9d0e803af7dfe921d404fa190e2ea9a04714aba224aa8bc10286398fd')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"

    # Some folders may have 777 permissions. See github.com/npm/npm issue 9359
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    chown -R root:root "${pkgdir}"

    # delete references to src and pkg dirs
    find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}

# vim:set ts=4 sw=4 et:
