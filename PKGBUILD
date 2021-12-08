# Maintainer: Paulo Matias <matias@ufscar.br>

pkgname=tk-itk
pkgver=4.1.0
pkgrel=2
pkgdesc="OOP extension for Tk"
arch=('x86_64')
url="http://incrtcl.sourceforge.net/itk/"
license=('custom')
depends=('tcl' 'tk')
source=(ftp://ftp.tcl.tk/pub/tcl/itcl/itk$pkgver.tar.gz)
sha256sums=('da646199222efdc4d8c99593863c8d287442ea5a8687f95460d6e9e72431c9c7')

build() {
  cd itk${pkgver}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --enable-64bit \
    --with-itcl=/usr/lib/itcl4.2.2
  make
}

check() {
  cd itk${pkgver}
  make test
}

package() {
  cd itk${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rmdir "${pkgdir}/usr/bin"
}
