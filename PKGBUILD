# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.8.3
pkgrel=1
pkgdesc='Scheme R5RS interpreter and compiler (via C)'
arch=('x86_64' 'i686')
url='http://gambitscheme.org/'
license=('LGPL2.1' 'Apache')
depends=('bash')
install="$pkgname.install"
options=('staticlibs')
source=("http://www.iro.umontreal.ca/~${pkgname%-c}/download/${pkgname%-c}/v${pkgver%.*}/source/${pkgname/-c/-v}${pkgver//./_}-devel.tgz")
sha256sums=('aeb28918ce7a6b44534326674cc500dd2456ca252ac205234ac817d5bd0fc0c1')

build() {
 cd "${pkgname/-c/-v}${pkgver//./_}-devel"

  ./configure \
    --prefix=/usr \
    --docdir=/usr/share/doc/gambit-c \
    --infodir=/usr/share/info \
    --libdir=/usr/lib/gambit-c \
    --enable-gcc-opts \
    --enable-single-host
  make
}

package() {
  make -C "${pkgname/-c/-v}${pkgver//./_}-devel" install DESTDIR="$pkgdir"

  # /usr/bin/gsc conflicts with ghostscript
  mv "$pkgdir/usr/bin/gsc" "$pkgdir/usr/bin/gambitc"
  ln -sf /usr/bin/gambitc "$pkgdir/usr/bin/gsc-script"
}

# getver: -u 2 gambitscheme.org/wiki/index.php/Main_Page
# vim:set ts=2 sw=2 et:
