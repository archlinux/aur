# Maintainer: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=dreamchess
pkgver=0.2.0
pkgrel=7
pkgdesc="An open source chess game with OpenGL graphics and various chess board sets"
arch=('i686' 'x86_64')
url="http://www.dreamchess.org/"
license=('GPL3')
depends=('mesa' 'mxml-dc' 'sdl_mixer' 'sdl_image')
makedepends=('autoconf' 'automake')
source=(${pkgname}-${pkgver}.tar.gz::http://sourceforge.net/projects/dreamchess/files/dreamchess/${pkgver}/${pkgname}-${pkgver}.tar.gz/download
        add-lpthread.diff
        link-with-libm.diff
        dreamchess.desktop)
md5sums=('0e837e14819c1e7d0232c6beb4d5c185'
         '7b2505302f63ee06039acb146326f306'
         '53ea942ed0d004df11e4ee7b9bff9890'
         '6034deb046a5eeecd17e23dd68ae2f71')        

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Patch
  patch -Np1 -i "$srcdir/add-lpthread.diff"
  patch -Np1 -i "$srcdir/link-with-libm.diff"
  autoreconf -i

  # Compile and install
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm 644 "$srcdir/dreamchess.desktop" "$pkgdir/usr/share/applications/dreamchess.desktop"
}
