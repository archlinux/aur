# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=createrepo_c
pkgver=0.1.14
pkgrel=2
pkgdesc="A C implementation of createrepo, a tool to create yum repositories"
arch=('i686' 'x86_64')
license=('GPL')
url='https://fedorahosted.org/createrepo_c/'
depends=('rpm-org' 'libxml2' 'curl' 'glib2')
makedepends=('cmake' 'doxygen' 'sqlite' 'zlib')
source=("https://fedorahosted.org/releases/c/r/createrepo_c/${pkgname}-${pkgver}.tar.xz")
sha256sums=('a3f545d45575ba5a70f68b174354dd6e6df096e30f2cab24bbe98b36d0f6527f')

build() {
  cd ${pkgname}-${pkgver}

  cmake -DLIB_INSTALL_DIR:PATH=/usr/lib \
	-DINCLUDE_INSTALL_DIR:PATH=/usr/include \
	.

  make
  make doc
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
