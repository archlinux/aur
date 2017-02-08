# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Matteo Paoluzzi <duwath [at] gmail [dot] com>
# Contributor: jmf <jmf [at] mesecons [dot] net>

pkgname=xephem
pkgver=3.7.7
pkgrel=4
pkgdesc="The Serious Interactive Astronomical Software Ephemeris"
arch=('i686' 'x86_64')
url="http://www.clearskyinstitute.com/xephem/xephem.html"
license=("custom")
depends=(libxmu lesstif)
makedepends=()
optdepends=(perl)
source=(http://www.clearskyinstitute.com/xephem/$pkgname-$pkgver.tgz)
md5sums=('27c67061a89085bf2b0d4e9deb758a79')

build() {
  #cd ${srcdir}/$pkgname-$pkgver/
  cd ${srcdir}/${pkgname}-${pkgver}/GUI/$pkgname
  export MAKEFLAGS="-j1"
  make MOTIF=/usr/lib/ 
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/GUI/$pkgname
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/${pkgname}-${pkgver}/GUI/$pkgname/xephem ${pkgdir}/usr/bin/
  
  mkdir -p ${pkgdir}/usr/share/$pkgname

  cp -R auxil    ${pkgdir}/usr/share/$pkgname/
  cp -R catalogs ${pkgdir}/usr/share/$pkgname/
  cp -R fifos    ${pkgdir}/usr/share/$pkgname/
  cp -R fits     ${pkgdir}/usr/share/$pkgname/
  cp -R gallery  ${pkgdir}/usr/share/$pkgname/
  cp -R help     ${pkgdir}/usr/share/$pkgname/
  cp -R lo       ${pkgdir}/usr/share/$pkgname/

  mkdir -p ${pkgdir}/usr/share/man/man1/
  cp xephem.1 ${pkgdir}/usr/share/man/man1/

#  mkdir -p ${pkgdir}/usr/lib/X11/app-defaults
#  echo "XEphem.ShareDir: /usr/share/xephem" > ${pkgdir}/usr/lib/X11/app-defaults/XEphem
  mkdir -p ${pkgdir}/usr/share/X11/app-defaults
  echo "XEphem.ShareDir: /usr/share/xephem" > ${pkgdir}/usr/share/X11/app-defaults/XEphem
  
  mkdir -p ${pkgdir}/usr/share/licenses/$pkgname/
  cp ${srcdir}/${pkgname}-${pkgver}/Copyright ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

}
