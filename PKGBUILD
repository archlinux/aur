pkgname=ortp-git
_basename="ortp"
pkgver=0.22.0.r276.gfbe5a32
pkgrel=1
pkgdesc="oRTP is a LGPL licensed C library implementing the RTP protocol (rfc3550)"
arch=(i686 x86_64)
url="http://www.linphone.org/"
license=('LGPL2')
options=(!libtool)
depends=('openssl' 'libsrtp')
source=("git://git.linphone.org/${_basename}.git")
sha256sums=('SKIP')

provides=("${_basename}")
conflicts=("${_basename}")

prepare() {
  cd "$_basename"
  ./autogen.sh
}

build() {
  cd "$_basename"
  ./configure --prefix=/usr 
  make
}

package() {
  cd "$_basename"
  make DESTDIR=$pkgdir install
}

pkgver() {
 cd "$_basename"
 git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}
