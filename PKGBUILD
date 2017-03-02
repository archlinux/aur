pkgname=mrpt
pkgver=1.5.0
pkgrel=1
pkgdesc="Provides an extensive set of libraries, algorithms, and applications employed in a number of mobile robotics research areas."
arch=('i686' 'x86_64')
url="http://www.mrpt.org"
license=('GPL3')
depends=('opencv' 'wxgtk' 'desktop-file-utils')
makedepends=('subversion' 'cmake' 'git')
optdepends=('ffmpeg: Video Support' 'freeglut' 'zlib'
            'libftdi' 'libdc1394' 'libusb: Kinect support'
            'pcl' 'assimp')
install=mrpt.install

_dir=${pkgname}-${pkgver}
source=("${_dir}"::"git+https://github.com/MRPT/mrpt.git")
md5sums=('SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver
  echo "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS="-fpermissive" \
        -DMRPT_OPTIMIZE_NATIVE=ON $srcdir/$pkgname-$pkgver
  make -j2
}

package() {
   cd $srcdir/$pkgname-$pkgver
   make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
