pkgname=mrpt
pkgver=1.5.3
pkgrel=1
pkgdesc="Provides an extensive set of libraries, algorithms, and applications employed in a number of mobile robotics research areas."
arch=('i686' 'x86_64' 'armv7h')
url="http://www.mrpt.org"
license=('GPL3')
depends=('opencv' 'wxgtk' 'desktop-file-utils')
makedepends=('subversion' 'cmake' 'git')
optdepends=('ffmpeg: Video Support' 'freeglut' 'zlib'
            'libftdi' 'libdc1394' 'libusb: Kinect support'
            'pcl' 'assimp')
install=mrpt.install

_dir=${pkgname}-${pkgver}
_tag=${pkgver}
source=("${_dir}"::"git+https://github.com/MRPT/mrpt.git"#tag=${_tag})
md5sums=('SKIP')

build() {
  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  cmake ${srcdir}/$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CXX_FLAGS="-fpermissive" \
        -DMRPT_OPTIMIZE_NATIVE=ON 
  make 
}

package() {
   cd "${srcdir}/build"
   make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
