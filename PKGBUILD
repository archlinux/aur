# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=pam_p11
pkgver=0.1.5
pkgrel=1
pkgdesc="PAM module for using crpytographic tokens such as smart cards and usb crypto tokens for authentication"
url="http://www.opensc-project.org/pam_p11"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('pam' 'libp11' 'openssl')
source=("http://downloads.sourceforge.net/project/opensc/pam_p11/$pkgname-$pkgver.tar.gz"
        "pam_symbols.ver")
sha256sums=('74da875467c4ba156f7cb7eaec0718f92dded03f40db3c6c0423c03f44d9f25a'
            '3359a9186617879479a4e943a16bc8c69e4d0ab259e6b729f983ca9328616756')

build() {
  # Taken from Gentoo ebuild
  LDFLAGS="$LDFLAGS -Wl,--version-script=$srcdir/pam_symbols.ver"
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --libdir=/lib --disable-static
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
