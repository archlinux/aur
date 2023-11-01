# Contributor: Miguel de Val-Borro <miguel.deval [at] gmail [dot] com>
# Contributor: Matteo Paoluzzi <duwath [at] gmail [dot] com>
# Contributor: jmf <jmf [at] mesecons [dot] net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xephem
_pkgname=XEphem
pkgver=4.1.0
pkgrel=2
pkgdesc="The Serious Interactive Astronomical Software Ephemeris"
arch=('i686' 'x86_64')
url="https://github.com/XEphem/XEphem"
license=('custom:MIT')
depends=('libxmu' 'openmotif' 'perl' 'openssl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"xephem.desktop" "xephem.png")
sha256sums=('8ab3670e303bdf209a673d5e091d1cd6e4577a0574da26a3c3d6629825f98241'
            'aa4e19b043cea5f13dcb9314b794c7152510a20289bf20a077a586ca913c65be'
            'fbca29143ecf5d89923ba6b68279cbc396886b229689dcd3b70999675bdb6c20')

build() {
  cd ${_pkgname}-${pkgver}/GUI/$pkgname
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

  install -Dm755 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm755 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  
  install -Dm644 "$srcdir"/${_pkgname}-${pkgver}/LICENSE \
	  "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
