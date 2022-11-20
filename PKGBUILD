# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=conflict
pkgver=20221002
pkgrel=1
pkgdesc='filename conflict listing'
arch=('x86_64')
url="https://invisible-island.net/${pkgname}/${pkgname}.html"
license=('MIT')
source=("https://invisible-mirror.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz"{,.asc})
depends=('glibc')
sha256sums=('8c183f3cabc814384db94a616d132f252753a8481a3f356a2135691d7d30dffc'
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
