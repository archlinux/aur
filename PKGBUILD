# Maintainer: Radoslaw Chmielarz <radoslaw.chmielarz@gmail.com>
pkgname=gnss-sdr-git
pkgver=v0.0.6.23
pkgrel=1
pkgdesc="GNSS (Global Navigation Satellite System) software receiver"
arch=("i686" "x86_64")
url=("http://gnss-sdr.org")
license=('GPL3')
depends=('gnuradio' 'gflags' 'google-glog' 'armadillo' 'gtest' 'gnutls-openssl')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("gnss-sdr::git+https://github.com/gnss-sdr/gnss-sdr.git")
md5sums=('SKIP')
pkgver() {
  cd gnss-sdr
  git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/./'
}
prepare() {
        cd gnss-sdr
}
build() {
 	cd gnss-sdr
	cmake -D CMAKE_INSTALL_PREFIX=/usr .
	make
}
package() {
	cd gnss-sdr
	make DESTDIR="$pkgdir/" install
}
