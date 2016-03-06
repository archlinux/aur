# Maintainer:  Nascher <kevin@nascher.org>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Philip Sequeira <phsequei@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: ZipFile <lin.aaa.lin@gmail.com>
# Contributor: Carlos Solis <csolisr at gmail dot com>

pkgname=stepmania
pkgver=5.0.10
pkgrel=3
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
        $pkgname-$pkgver.tar.gz::https://github.com/stepmania/stepmania/archive/v$pkgver.tar.gz)
sha512sums=('e066ac27932e795078a3a9b1073f280f10f140b2dd776f12efdc469d327d13c2fccdc87f823a32d91c9896b5ea1e98fca404cfadcf55c97ea22a179e5ca21412'
            'a136c74c71730bbac0d90e876d0f8de066c5f4cfba1923f649d085c7590a3624bd469d03daacc7e4ff5f23c1de2907c015c5a9b6df66f5fce584cf912e9e5c58'
            'd242d76aed7a72bc2bf7e0ffa222de6f889422956b4f6bad88d54556fca511735c2d3249693b43232190075b1d4c4a0166606fc7b57057edf1b6c1ca34f958e7')

build() {
  cd "$srcdir/$pkgname-$pkgver/Build"
  cmake -D WITH_SYSTEM_FFMPEG=Off ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/opt/$pkgname/"{RandomMovies,Packages}
  install -t "$pkgdir/opt/$pkgname/" stepmania GtkModule.so
  install -D "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -D "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
 
  cp -r -t "$pkgdir/opt/$pkgname/" Announcers BGAnimations BackgroundEffects \
     BackgroundTransitions Characters Courses Data Docs NoteSkins Scripts \
     Songs Themes

  install -D -m644 Docs/Licenses.txt "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
  cp -ar icons "$pkgdir/usr/share/"

}

