# Maintainer: Michał Szymański <smiszym at gmail dot com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=vodovod
pkgver=1.10
pkgrel=4
pkgdesc=" A free cross-platform pipe connecting game"
arch=('i686' 'x86_64')
url="http://home.gna.org/vodovod/"
license=('GPL')
depends=('sdl_mixer' 'sdl_image')
source=(http://download.gna.org/vodovod/$pkgname-$pkgver-src.tar.gz fix-FTBFS-with-gcc-4.3.patch \
	 user_files.patch vodovod.desktop vodovod.xpm)
md5sums=('fc9baa1704b006761bec5e4e64b7ee9d'
         '36fb64ffaaf24f45d0678eccbbe0b180'
         '1d29988a13474cdb5ae4822818573825'
         'db28845dc4a8031fc45ca05e38d462f8'
         '94fed2d1ab825bdf9811c59d305398d4')

build()
{
        cd ${srcdir}/$pkgname-$pkgver-src
        patch -p1 < ../user_files.patch
        patch -p1 < ../fix-FTBFS-with-gcc-4.3.patch
        make
}

package()
{
        cd ${srcdir}/$pkgname-$pkgver-src
        mkdir -p ${pkgdir}/usr/share/{applications,vodovod,pixmaps}
        mkdir -p ${pkgdir}/usr/bin
        cp -R vodovod data html ${pkgdir}/usr/share/vodovod
        echo "cd '/usr/share/vodovod/' && ./vodovod" > ${pkgdir}/usr/bin/vodovod
        chmod 755 ${pkgdir}/usr/bin/vodovod
        install ../vodovod.desktop ${pkgdir}/usr/share/applications
        install ../vodovod.xpm ${pkgdir}/usr/share/pixmaps
}
