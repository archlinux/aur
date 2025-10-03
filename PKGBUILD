# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Eli Schwartz <eschwartz@archlinux.org>

pkgname=conflict
pkgver=20250930
pkgrel=1
pkgdesc='Displays conflicting filenames in your execution path'
arch=('x86_64' 'aarch64')
url="https://invisible-island.net/${pkgname}/${pkgname}.html"
license=('MIT')
source=("https://invisible-mirror.net/archives/${pkgname}/${pkgname}-${pkgver}.tgz"{,.asc})
depends=('glibc')
sha256sums=('0a629a4d23df9f5fb22c2af90778c6da1176f3907b412405f8518a9fdf405f1d'
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
