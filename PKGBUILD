# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Larry Hajali <larryhaja [at] gmail [dot] com>

pkgname=pasang-emas
pkgver=6.3.0
pkgrel=1
pkgdesc="Pasang-emas is a traditional two-player board game of Brunei."
arch=('i686' 'x86_64')
url="http://pasang-emas.sourceforge.net/index.xhtml"
license=('GPL3')
depends=('gtk3')
makedepends=('itstool')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}/${pkgname}-${pkgver}.tar.xz"
	"http://downloads.sourceforge.net/${pkgname}/${pkgname}-themes-1.0.tar.bz2"
        "http://downloads.sourceforge.net/${pkgname}/pet-marble.tar.bz2"
        "http://downloads.sourceforge.net/pasang-emas/pet-fragrance.tar.bz2")
md5sums=('0dfe5e816feea53e9c60428a7b1d8bbe'
         'b0cc4af9ec0f3b0a7b74ecfc13ce9399'
	 '925f78cc8fb25f3bb8ca5f5ba9d3ae64'
         '4710b67c37f85e7d542ad8a02755471b')

build()
{
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc
  make

  # Configure themes.
  cd ../${pkgname}-themes-1.0
    ./configure \
      --prefix=/usr
}

package()
{
  cd ${pkgname}-${pkgver}
  make install DESTDIR="${pkgdir}"

  # Install themes.
  make -C ../${pkgname}-themes-1.0 install DESTDIR="${pkgdir}"
  cp -ar ../marble ../fragrance "${pkgdir}"/usr/share/${pkgname}/themes
}
