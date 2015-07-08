# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=arkanae3_2d
pkgver=0.1
pkgrel=3
pkgdesc="Jeu de rôles / aventure libre en 3D (only in French)"
arch=(any)
url="http://home.gna.org/oomadness/fr/arkanae_iii/"
license=('GPL')
depends=('python2-cerealizer' 'sdl' 'python2-pygame')
makedepends=(python2-distribute)
changelog=Changelog
source=(http://download.gna.org/balazar/Arkanae3_2d-$pkgver.tar.bz2
        arkanae3_2d.desktop)
md5sums=('02da7f6a57f0d346f931449615fe3fb7'
         'f81e02c9d1965debd3b8fe0489ea5a32')

build() {
  cd "$srcdir/Arkanae3_2d-$pkgver"
  # There's no English version, but globdef.py wants there to *only*
  # be an English version. Change to French.
  sed -i -e 's/\("en",\)/\("fr",\)/g' globdef.py

  python2 setup.py install --root="$pkgdir"
  
  #desktop icons
	#mkdir -p $pkgdir/usr/share/pixmaps
	#cp $srcdir/Arkanae3_2d-$pkgver/data/arkanae3_2d.png $pkgdir/usr/share/pixmaps/arkanae3_2d.png
	
	install -D -m644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
