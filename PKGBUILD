# Maintainer: Radoslaw Chmielarz <radoslaw.chmielarz@gmail.com>
pkgname=gnss-sdr-git
pkgver=v0.0.6.4935
pkgrel=1
pkgdesc="GNSS (Global Navigation Satellite System) software receiver"
arch=("i686" "x86_64")
url="http://gnss-sdr.org"
license=('GPL3')
depends=('armadillo' 'libvolk' 'gnuradio' 'blas' 'lapack' 'gflags' 'google-glog' 'gnutls' 'pugixml'
	 'protobuf' 'python-mako' 'python-six' 'libmatio' 'libpcap' 'hdf5')
makedepends=('gcc' 'make' 'cmake' 'git' 'boost' 'boost-libs' 'log4cpp' 'gnuradio-osmosdr')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('gnss-sdr::git+https://github.com/gnss-sdr/gnss-sdr.git')
md5sums=('SKIP')
pkgver() {
  cd gnss-sdr
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}
build() {
 	cd "$srcdir"/gnss-sdr/build
	cmake -D CMAKE_INSTALL_PREFIX=/usr -DENABLE_OSMOSDR=ON -DENABLE_UNIT_TESTING=OFF ..
	make
}
package() {
	cd "$srcdir"/gnss-sdr/build
	make DESTDIR="$pkgdir/" install
}
