# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=xiphos-git
pkgver=4.1.0.r63.gd1dd1598
pkgrel=1
epoch=1
pkgdesc="A Bible study tool -- git version"
arch=('i686' 'x86_64')
url="http://xiphos.org"
license=('GPL')
depends=('gconf' 'webkit2gtk' 'libgsf' 'sword>=1.8.1' 'gtkhtml4' 'biblesync-git')
makedepends=('cmake' 'gtkmm' 'libgsf' 'libxml2' 'gnome-common' 'gnome-doc-utils'
	     'intltool' 'git' 'python2' 'docbook-utils')
provides=('gnomesword' 'xiphos')
conflicts=('gnomesword' 'xiphos')
source=(git+https://github.com/crosswire/xiphos.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed 's+-+.r+'|tr - .
}

build() {
  [[ -d build ]] || mkdir build
  cd build
  cmake ../${pkgname%-git} -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release -DGTKHTML=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
