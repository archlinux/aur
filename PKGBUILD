# Maintainer:  Nascher <kevin@nascher.org>
# Contributor: Artefact2 <artefact2@gmail.com>
# Contributor: Philip Sequeira <phsequei@gmail.com>
# Contributor: Lauri Niskanen <ape@ape3000.com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>
# Contributor: Stefan Lohmaier <noneuss at gmail dot com>
# Contributor: ZipFile <lin.aaa.lin@gmail.com>
# Contributor: Carlos Solis <csolisr at gmail dot com>

pkgname=stepmania
pkgver=5.0.12
pkgrel=1
pkgdesc='A free dance and rhythm game (was previously sm-ssc)'
url='http://www.stepmania.com/'
license=('MIT')
arch=(i686 x86_64)
depends=('gtk2' 'libmad' 'mesa' 'glew' 'libpng' 'libvorbis')
replaces=('sm-ssc')
makedepends=('pkgconfig' 'yasm' 'cmake' 'gcc5' 'git')
install='stepmania.install'
source=(stepmania.sh
        stepmania.install
        $pkgname-$pkgver.tar.gz::https://github.com/stepmania/stepmania/archive/v$pkgver.tar.gz)
sha256sums=('addfbc088b9b700330ab633d1b2786fc723d00357e4ad738dd5f92ceab33e29e'
            '52badaf74204e3fe0ff626b08510a2a0cdf82fa58e7afd2f1a5149a5d26ace25'
            'df79bcadd69d4ed60cf560d45386ec275181343495ffd744c3ff8f73c83d4755')

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
