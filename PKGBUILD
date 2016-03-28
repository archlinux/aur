# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.8.4
pkgrel=1
pkgdesc='Scheme R5RS interpreter and compiler (via C)'
arch=('x86_64' 'i686')
url='http://gambitscheme.org/'
license=('LGPL2.1' 'Apache')
depends=('bash')
install="$pkgname.install"
options=('staticlibs')
source=("http://www.iro.umontreal.ca/~${pkgname%-c}/download/${pkgname%-c}/v${pkgver%.*}/source/${pkgname/-c/-v}${pkgver//./_}-devel.tgz")
sha256sums=('daeaaa55f0c5076686313017c7c3676c60db14cbf2b55dd6023e8ed1fcfff218')

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
