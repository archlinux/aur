# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=conflict
pkgver=20250117
pkgrel=1
pkgdesc='filename conflict listing'
arch=('x86_64')
url="https://invisible-island.net/${pkgname}/${pkgname}.html"
license=('MIT')
source=("https://invisible-mirror.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz"{,.asc})
depends=('glibc')
sha256sums=('a569507482cc0d2246a321eba528b85bb9315db46dc2de14b321e261ab90feed'
            'SKIP')
validpgpkeys=('19882D92DDA4C400C22C0D56CC2AF4472167BE03') # Thomas Dickey <dickey@invisible-island.net> https://invisible-mirror.net/public/public.html

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
