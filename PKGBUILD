# Maintainer : David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: Ravi Desai <ravster3@hotmail.com>

pkgname=gpa
pkgver=0.10.0
pkgrel=2
pkgdesc="A graphical user interface for the GnuPG"
arch=('x86_64')
url="https://www.gnupg.org/related_software/gpa/"
license=('GPL3')
depends=('gpgme' 'gtk2')
source=("ftp://ftp.gnupg.org/gcrypt/gpa/gpa-$pkgver.tar.bz2"{,.sig})
sha512sums=('87004fb0806e76012bc194f95afe9ef6044aec890b26e845f45c314e1bd8864f056ba5e32f9ef2e15b24b50840235e6e548a5e3006b255b4f1c20e0fd7710a3b'
            'SKIP')
validpgpkeys=(D8692123C4065DEA5E0F3AB5249B39D24F25E3B6) # Werner Koch

prepare() {
  cd "${pkgname}-${pkgver}"
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {AUTHORS,ChangeLog,NEWS,README,THANKS,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
