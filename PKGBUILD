# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Babeux <christian.babeux@0x80.ca>

pkgname=gambit-c
pkgver=4.7.3
pkgrel=1
pkgdesc='Scheme R5RS interpreter and compiler (via C)'
arch=('x86_64' 'i686')
url='http://dynamo.iro.umontreal.ca/wiki/index.php/Main_Page'
license=('LGPL2.1' 'Apache')
depends=('bash')
install="$pkgname.install"
options=('staticlibs')
source=("http://www.iro.umontreal.ca/~${pkgname%-c}/download/${pkgname%-c}/v${pkgver%.*}/source/${pkgname/it-}-v${pkgver//./_}.tgz")
sha256sums=('59c4c62f2cfaf698b54a862e7af9c1b3e4cc27e46d386f31c66e00fed4701777')

build() {
 cd "${pkgname/it-}-v${pkgver//./_}"

  ./configure --prefix=/usr --docdir=/usr/share/doc/gambit-c \
    --infodir=/usr/share/info --libdir=/usr/lib/gambit-c \
    --enable-gcc-opts --enable-single-host
  make
}

package() {
  make -C "${pkgname/it-}-v${pkgver//./_}" install DESTDIR="$pkgdir"
  # gsc conflicts with the one provided by ghostscript
  mv "$pkgdir/usr/bin/gsc" "$pkgdir/usr/bin/gambitc"
  ln -sf /usr/bin/gambitc "$pkgdir/usr/bin/gsc-script"
}

# vim:set ts=2 sw=2 et:
