# Maintainer: Ivan Agarkov <ivan.agarkov@gmail.com>

pkgname=eggdrop-git
pkgver=v1.8.0rc1
pkgrel=1
pkgdesc="The most famous IRC TCL bot"
arch=('any')
license=('GPL2')
url="https://github.com/eggheads/eggdrop"
depends=('tcl' 'openssl')
makedepends=('make' 'autoconf' 'gcc')
provides=('eggdrop')
replaces=('eggdrop' 'eggdrop-cvs')
source=("eggdrop-git"::"git+https://github.com/eggheads/eggdrop.git#branch=release/1.8.0")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure "--prefix=/opt/eggdrop"
  make config
  make
}

package() {
	cd "${srcdir}/${pkgname}"
  make install DEST="${pkgdir}/opt/eggdrop"
}
