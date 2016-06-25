# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past Maintainer: bslackr <brendan at vastactive dot com>

pkgname=sucrack
pkgver=1.2.3
pkgrel=6
pkgdesc='a multi-threaded Linux/UNIX tool for brute-force cracking local user accounts via su'
url='http://labs.portcullis.co.uk/application/sucrack'
license=('custom')
arch=('i686' 'x86_64')
source=("http://labs.portcullis.co.uk/download/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('6ea47a542a652ce416af9f8dece569eec6662a361860a150291e1f6c23ff0cc8288b573aee047624c4c2c32f51aa01c6ce88177a0f41353b17c891d905085a41'
            'SKIP')

build() {
  unset LDFLAGS
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-static-buffer
  make
}

check() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make -k check
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
