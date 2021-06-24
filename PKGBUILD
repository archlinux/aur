# Contributor: Miguel de Val-Borro <miguel.deval [at] gmail [dot] com>
# Contributor: Matteo Paoluzzi <duwath [at] gmail [dot] com>
# Contributor: jmf <jmf [at] mesecons [dot] net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xephem
_pkgname=XEphem
pkgver=4.0.2
pkgrel=1
pkgdesc="The Serious Interactive Astronomical Software Ephemeris"
arch=('i686' 'x86_64')
url="https://github.com/XEphem/XEphem"
license=('custom:MIT')
depends=('libxmu' 'openmotif' 'perl' 'openssl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('144db16100c7eac8a9b563cd9398a295e11a3a65fa5f543b1c93191370e5dd72')

build() {
  cd ${_pkgname}-${pkgver}/GUI/$pkgname
  export MAKEFLAGS+="-j1"
  make MOTIF=/usr/lib/ 
}

package() {
  cd ${_pkgname}-${pkgver}/GUI/$pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -d "$pkgdir"/usr/share/$pkgname

  cp -R auxil    "$pkgdir"/usr/share/$pkgname/
  cp -R catalogs "$pkgdir"/usr/share/$pkgname/
  cp -R fifos    "$pkgdir"/usr/share/$pkgname/
  cp -R fits     "$pkgdir"/usr/share/$pkgname/
  cp -R gallery  "$pkgdir"/usr/share/$pkgname/
  cp -R help     "$pkgdir"/usr/share/$pkgname/
  cp -R lo       "$pkgdir"/usr/share/$pkgname/

  install -Dm644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1

  install -d "$pkgdir"/usr/share/X11/app-defaults
  echo "XEphem.ShareDir: /usr/share/xephem" > "$pkgdir"/usr/share/X11/app-defaults/XEphem
  
  install -Dm644 "$srcdir"/${_pkgname}-${pkgver}/LICENSE \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
