# Maintainer: Félicien PILLOT <felicien.pillot@member.fsf.org>
pkgname=fisoco-git
pkgver=0.3
pkgrel=0
pkgdesc="a Finding, Sorting and Converting free software"
url="https://github.com/Felandral/Fisoco"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=()
makedepends=('git' 'gtkmm3' 'intltool')
conflicts=()
replaces=()
backup=()
source=("${pkgname}-${pkgver}::git+http://github.com/Felandral/Fisoco#branch=master")
md5sums=('SKIP')
pkgver() {
  cd "$srcdir/$pkgname-$pkgver"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	aclocal
	intltoolize
	autoreconf
	./configure --prefix=$HOME/build/local/fisoco
	make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install && make clean
}


