# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=dclib
pkgver=0.3.23
pkgrel=2
pkgdesc="Libraries for the Direct Connect 4 Linux (Valknut) File Sharing program"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wxdcgui/"
license=('GPL')
depends=('openssl' 'bzip2' 'libxml2' 'libstdc++5')
source=(http://downloads.sourceforge.net/sourceforge/wxdcgui/$pkgname-$pkgver.tar.bz2
        http://sourceforge.net/p/wxdcgui/bugs/_discuss/thread/90105573/5667/attachment/dclib-0.3.23-openssl.patch)
md5sums=('6852e420e48d09b514fcb9f783611cdc'
         'c07f5bcad5b7992b74e9472b7d47fd27')

prepare() {
  cd "${srcdir}"/$pkgname-$pkgver

  patch -Np1 -i "${srcdir}"/dclib-0.3.23-openssl.patch
}

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
