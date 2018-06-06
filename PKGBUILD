# Mantainer: 3ED <krzysztof1987 /at/ gmail.com>

pkgname=freeme2
_pkgname=FreeMe2
pkgver=0.4
pkgrel=3
pkgdesc="It strips wm-drm protection from wmv/asf/wma files as well as video/audio streams."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/freeme2/"
license=('GPL')
depends=('openssl-1.0')
source=(http://downloads.sf.net/sourceforge/${pkgname}/${_pkgname}_src-${pkgver}.tgz)
sha256sums=('5cbe96b0099a85465b81a0b457a7974fd8b5ba931548571b9a209a9d266750be')

prepare() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
}
build() {
  cd "$srcdir/$_pkgname"

  # openssl-1.0
  export \
    CFLAGS="$CFLAGS -I/usr/include/openssl-1.0" \
    CPPFLAGS="$CPPFLAGS -I/usr/include/openssl-1.0" \
    LDFLAGS="$LDFLAGS -L/usr/lib/openssl-1.0/"

  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
