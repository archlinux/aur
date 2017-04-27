# Maintainer: Fabio Zanini <fabio . zanini at fastmail dot fm>

pkgname='singularity-container-git'
pkgver=2.2.r500.g6007d3a1
pkgrel=1
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='http://singularity.lbl.gov'
license=('BSD')
depends=('bash' 'python')
provides=('singularity-container')
conflicts=('singularity-container')
source=('git+https://github.com/gmkurtzer/singularity')
md5sums=('SKIP')

pkgver() {
  cd "singularity"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/singularity"
  ./autogen.sh
  ./configure --prefix='/usr'
  make
}

package() {
  cd "${srcdir}/singularity"
  make DESTDIR="$pkgdir" install
}
