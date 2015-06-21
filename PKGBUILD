# Maintainer: Michał Szymański <smiszym at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>

pkgname=rezerwar
pkgver=0.4.2
pkgrel=3
pkgdesc="Puzzle game that could be described as a mix of a known tetromino game and the average pipe game"
arch=('i686' 'x86_64')
url="http://tamentis.com/projects/rezerwar/"
license=('BSD')
depends=('sdl_mixer')
makedepends=('make')
source=("http://tamentis.com/projects/${pkgname}/files/${pkgname}-${pkgver}.tar.gz"
        rezerwar.desktop)
md5sums=('42018abe251e45ab8cc30133cde61ff8'
         'a9afa64e7b067d89f65c2d5fe8e4b200')

build()
{
        cd "${srcdir}/${pkgname}-${pkgver}"
        sed -i "s|/share/games/rezerwar|/share/rezerwar|g" configure
        sed -i "s|/games|/bin|g" configure
        sed -i "s|/share/doc/rezerwar|/share/rezerwar/doc|g" configure
        ./configure 
        make
}

package()
{
        cd "${srcdir}/${pkgname}-${pkgver}"
        mkdir -p ${pkgdir}/usr/share/{applications,rezerwar}
        mkdir -p ${pkgdir}/usr/bin
        cp -rf doc ${pkgdir}/usr/share/rezerwar/
        cp -rf data/* ${pkgdir}/usr/share/rezerwar/
        install -m 755 src/rezerwar ${pkgdir}/usr/bin
        install -m 755 ${srcdir}/rezerwar.desktop ${pkgdir}/usr/share/applications
}
