#Contributor: Jake VanderKolk <jakevanderkolk@gmail.com>
#Maintainer: Mihai Coman <mihai@m1x.ro>
pkgname=fbxkb
pkgver=0.6
pkgrel=2
pkgdesc="Keyboard indicator and switcher"
arch=('i686' 'x86_64')
url="http://fbxkb.sourceforge.net/"
depends=('gtk2' 'libx11' 'libxmu')
license=('GPL')
source=(http://download.sourceforge.net/fbxkb/${pkgname}-${pkgver}.tgz
	fbxkb.patch)
md5sums=('fa768bbb07aac8a4ae590633499cce15'
         '33171c56c308eb68cb5035762fbb8aa0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    unset LDFLAGS
    patch -Np1 -i "${srcdir}/fbxkb.patch" || return 1
    ./configure --prefix=/usr
    make || return 1
    make PREFIX="${pkgdir}/usr" install
}
