# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=conflict
pkgver=20201018
pkgrel=1
pkgdesc='filename conflict listing'
arch=('x86_64')
url="https://invisible-island.net/${pkgname}/${pkgname}.html"
license=('MIT')
source=("https://invisible-mirror.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz"{,.asc})
depends=('glibc')
sha256sums=('e9645ebba9d65f3c5d9dc49fee0ea74def1538d29e7ca90de92d5ce3b7720c93'
            '0dcd21164a1ebe97406e8498bcef1855613b86f12df721327fd7910c563ad1f8')
validpgpkeys=('C52048C0C0748FEE227D47A2702353E0F7E48EDB') # Thomas Dickey <dickey@invisible-island.net>

build() {
    cd ${pkgname}-${pkgver}

    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR="${pkgdir}" install
    install -Dm0644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
}
