# Maintainer: Gianluca Montecchi <gian@grys.it>

pkgname=libvmime
pkgver=0.9.2
pkgrel=1
pkgdesc="An open source solution for working with MIME messages and Internet messaging services like IMAP, POP or SMTP."
arch=(any)
url="http://www.vmime.org/"
license=('GPL')
depends=('gsasl'
         'gnutls'
				 'exim')
makedepends=('cmake')
conflicts=('zarafa-libvmime' 'libvmime-git')
replaces=('zarafa-libvmime' 'libvmime-git')
optdepends=()
backup=()
source=("https://github.com/kisli/vmime/archive/v$pkgver.tar.gz")
md5sums=('64ea8fad39df20f7bf32573ee37f4a6f' )

prepare() {
  mkdir build
}

build() {
  cd build

  cmake ../vmime-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib/ \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd 'build'

  make DESTDIR="$pkgdir" install
}
