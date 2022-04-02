# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=conflict
pkgver=20210108
pkgrel=1
pkgdesc='filename conflict listing'
arch=('x86_64')
url="https://invisible-island.net/${pkgname}/${pkgname}.html"
license=('MIT')
source=("https://invisible-mirror.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz"{,.asc})
depends=('glibc')
sha256sums=('90e878233d022c4e7507cf9e7424c3131c016b00f00f6661dae7ee1a29239a56'
            'b9e4315590572b6f697d859bf89d984e2bf2810309ceab4ef95ed1bb2d5d9653')
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
