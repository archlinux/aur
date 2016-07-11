# Maintainer:  Nascher <kevin@nascher.org>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Philip Sequeira <phsequei@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: ZipFile <lin.aaa.lin@gmail.com>
# Contributor: Carlos Solis <csolisr at gmail dot com>

pkgname=stepmania
pkgver=5.0.11
pkgrel=3
pkgdesc='A free dance and rhythm game (was previously sm-ssc)'
url='http://www.stepmania.com/'
license=('MIT')
arch=(i686 x86_64)
depends=('gtk2' 'libmad' 'mesa' 'glew' 'libpng' 'libvorbis')
replaces=('sm-ssc')
makedepends=('pkgconfig' 'yasm' 'cmake' 'gcc5')
install='stepmania.install'
source=(stepmania.sh
        stepmania.install
        $pkgname-$pkgver.tar.gz::https://github.com/stepmania/stepmania/archive/v$pkgver.tar.gz)
sha512sums=('e066ac27932e795078a3a9b1073f280f10f140b2dd776f12efdc469d327d13c2fccdc87f823a32d91c9896b5ea1e98fca404cfadcf55c97ea22a179e5ca21412'
            'a136c74c71730bbac0d90e876d0f8de066c5f4cfba1923f649d085c7590a3624bd469d03daacc7e4ff5f23c1de2907c015c5a9b6df66f5fce584cf912e9e5c58'
            '6ef126da5b5690e8fcdbebd9b3a0ee6411dd3cb43209c0e209399e711dc6d449aae1372de92ee0be20af9c3fba1c55ec27087e86a0aeb874535d0a39167f98c3')

build() {
  cd "$srcdir/$pkgname-$pkgver/Build"
  export CC=/usr/bin/gcc-5
  export CXX=/usr/bin/g++-5

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
