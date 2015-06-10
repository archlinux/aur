# Maintainer: ianux <ianux@free.fr>
 
pkgname=opendcp-git
pkgver=0.28.1.r104.gbe6d55d
pkgrel=2
pkgdesc="An open source program to create digital cinema packages (DCP) for use in digital cinema"
url="https://github.com/tmeiczin/opendcp"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('asdcplib' 'libtiff' 'libxml2' 'libxslt' 'openjpeg' 'openssl' 'qt4' 'xmlsec')
makedepends=('cmake' 'git')
source=("$pkgname"::'git+https://github.com/tmeiczin/opendcp.git' "opendcp.install")
sha256sums=('SKIP'
            '83cb64a1b0edaf1f24408ed6dbcfdc1db7c1a7b9244b0ec7c65c6131a622b9d9')

pkgver() {
  cd ${srcdir}/${pkgname}
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}/${pkgname}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_GUI=ON .
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
}
