# Maintainer: Michał Szymański <smiszym at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau gmail.com>

pkgname=longloops
pkgver=1.0.1
pkgrel=3
pkgdesc="Brain-stretching game in which you must build loops out of sections of pipe."
arch=('i686' 'x86_64')
url="https://launchpad.net/longloops/"
license=('GPL')
depends=('gtk2' 'gtkmm')
madepends=('make' 'intltool')
source=(https://launchpad.net/%7Emusic1/+archive/ppa/+files/${pkgname}_${pkgver}.orig.tar.gz longloops.desktop)
md5sums=('0e4470e33ad299e04753a0f17d108298'
         'e3552cecd0d1165eac9e74b6f1889464')

build()
{
        cd ${srcdir}/${pkgname}-${pkgver}
        ./configure --prefix=/usr
        make
}

package()
{
        cd ${srcdir}/${pkgname}-${pkgver}
        make DESTDIR=${pkgdir} install
        mv ${pkgdir}/usr/doc ${pkgdir}/usr/share/
        mkdir -p -p ${pkgdir}/usr/share/{applications,pixmaps}
        install ${srcdir}/longloops.desktop ${pkgdir}/usr/share/applications
        install src/icon.xpm ${pkgdir}/usr/share/pixmaps/longloops.xpm
}
