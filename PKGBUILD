# Contributor: maz-1 <loveayawaka_at_gmail_dot_com>

pkgname=gimp-voronoi
_pkgname=voronoi
pkgver=2.2
pkgrel=5
pkgdesc="A GIMP plug-in to create Voronoi patterns"
url="http://trific.ath.cx/software/gimp-plugins/voronoi/"
depends=('gimp>=2.0')
# Official site is no longer existent
#source=(http://trific.ath.cx/software/gimp-plugins/voronoi/voronoi-${pkgver}.tar.bz2)
source=("voronoi-${pkgver}.tar.bz2::http://storage.live.com/items/EED7455B8FCA288F%211031?a.tar.bz2" 
		"x86_64.patch")
arch=('i686' 'x86_64')
license=('GPL')
md5sums=('e18c9d719ce84ae198c582d2dfa8229f' '1e8f4253a27a15ce5d0d903e8c6872ec')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

# Patch and build
  [ "${CARCH}" = "x86_64" ] && (patch -Np0 -i ../x86_64.patch || return 1)
  make || return 1
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  /usr/bin/install -D -m 755 voronoi ${pkgdir}/usr/lib/gimp/2.0/plug-ins/voronoi
}
