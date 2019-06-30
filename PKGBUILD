#Maintainer: William J. Bowman <aur@williamjbowman.com>

pkgname=ect
pkgver=0.8.2
pkgrel=2
pkgdesc='Efficient Compression Tool (or ECT) is a ++ file optimizer. It supports PNG, JPEG, GZIP and ZIP files.'
url='https://github.com/fhanau/Efficient-Compression-Tool'
arch=('i686' 'x86_64')
license=('Apache2')
source=("ect::git+https://github.com/fhanau/Efficient-Compression-Tool.git#tag=v${pkgver}")
sha256sums=('SKIP')
makedepends=('nasm' 'git')

prepare(){
	cd "${srcdir}/${pkgname}/src"
  git submodule update --init --recursive --recommend-shallow
  cd mozjpeg
  autoreconf -i
}

build() {
	cd "${srcdir}/${pkgname}/src"
  make
}

package() {
	cd "${srcdir}/${pkgname}/src"

  PREFIX=/usr/ DESTDIR="${pkgdir}" make install
	cd "${pkgdir}"/usr/bin

  # Some things expect this to be an all-caps name
	ln -s ect ECT
}
