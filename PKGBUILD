# Maintainer:  Nascher <kevin at nascher.org>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Philip Sequeira <phsequei@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: ZipFile <lin.aaa.lin@gmail.com>
# Contributor: Carlos Solis <csolisr at gmail dot com>

pkgname=stepmania
pkgver=5.0.9
pkgrel=1
pkgdesc='A free dance and rhythm game (was previously sm-ssc)'
url='http://www.stepmania.com/'
license=('MIT')
arch=(i686 x86_64)
depends=('gtk2' 'libmad' 'mesa' 'glew' 'libpng' 'libvorbis')
replaces=('sm-ssc')
makedepends=('pkgconfig' 'yasm' 'cmake')
install='stepmania.install'
source=(stepmania.sh
        stepmania.install
        https://github.com/stepmania/stepmania/archive/v$pkgver.tar.gz)
sha512sums=('e066ac27932e795078a3a9b1073f280f10f140b2dd776f12efdc469d327d13c2fccdc87f823a32d91c9896b5ea1e98fca404cfadcf55c97ea22a179e5ca21412'
            'a136c74c71730bbac0d90e876d0f8de066c5f4cfba1923f649d085c7590a3624bd469d03daacc7e4ff5f23c1de2907c015c5a9b6df66f5fce584cf912e9e5c58'
            'e4a080c26295b090efacb832f95e3ac0f9ea9b423bb5b5ab5c8d9e057cf2f6785f3d554a49005a03440df223af34971244f5761ef6952f18562343ba77929dc5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh
  ./configure --prefix="$pkgdir/opt" 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make install
  install -D -m755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -D -m755 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
  cp -ar icons "$pkgdir/usr/share/"

  cd "$pkgdir/opt/"
  mv stepmania-5.0 stepmania

  cp -r -t "$pkgdir/opt/stepmania" "$srcdir/$pkgname-$pkgver/Songs"
}
