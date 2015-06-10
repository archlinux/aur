# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: juice <juice@sofy.sk> 

pkgname=selectwm
pkgver=0.4.1
pkgrel=3
pkgdesc="A window manager selector tool"
arch=('i686' 'x86_64')
url="http://ordiluc.net/selectwm/"
license=('GPL')
depends=('gtk2')
source=("http://ordiluc.net/selectwm/${pkgname}-${pkgver}.tar.bz2"
        "${pkgname}.patch")
md5sums=('160199961c552922b5880ebf7e201c3c'
         '23e642bf3b8445a88d1e415c13ac25c4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i ../${pkgname}.patch

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
