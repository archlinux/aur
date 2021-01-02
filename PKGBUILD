# Maintainer: nimius <l.wieling@gmx.de>
# Contributor: dustball

pkgname=gnaural
pkgver=20110606
pkgrel=3
pkgdesc="An opensource binaural-beat generator"
arch=(i686 x86_64)
url="http://gnaural.sourceforge.net/"
license=('GPL')
depends=('libglade' 'portaudio')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/Gnaural/${pkgname}_${pkgver}.tar.xz"
        "gnaural.patch")
md5sums=('a3f909ca56466393c9eef42f25fc028b'
         '7b8a6f84ca8aeb01cf5b46e76027c1b5')

build() {
  cd "$srcdir/${pkgname}_${pkgver}"

  patch --strip=1 < "$srcdir/gnaural.patch"

  ./configure CFLAGS='-fcommon' --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
