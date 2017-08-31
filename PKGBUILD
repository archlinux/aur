# Maintainer: Olivier Le Moal <mail at olivierlemoal dot fr>
pkgname=yersinia-git
pkgver=v0.8.2.r10.gdc2aa7b
pkgrel=1
pkgdesc="A network tool designed to take advantage of some weakness in different network protocols"
url="https://github.com/tomac/yersinia"
depends=('libpcap' 'libnet')
optdepends=('gtk2: required for the gtk 2.0 interface')
conflicts=('yersinia')
license=("GPL")
arch=('i686' 'x86_64')
makedepends=('git')
source=('yersinia::git+https://github.com/tomac/yersinia#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/yersinia/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/yersinia/"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "${srcdir}/yersinia/"
	make DESTDIR=${pkgdir} install
}
