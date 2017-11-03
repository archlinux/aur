# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: PyroPeter <com.googlemail@abi1789>

pkgname=otrtool
pkgver=1.2.1
pkgrel=1
pkgdesc="Open source decoder for .otrkey files (onlinetvrecorder.com) [otrdecoder]"
arch=('i686' 'x86_64')
url="http://pyropeter.github.com/otrtool/"
license=('custom:CC0')
depends=('curl' 'libmcrypt')
source=("http://github.com/pyropeter/otrtool/tarball/v${pkgver}")
sha512sums=('d441ac747c245d1664fb391eb4260ba2b71706fe435e0e6f45a125fc602818686bc51f3190ec95759da3faa253fdcbc502ad05faa321664d5ccb95ae51c68371')

prepare() {
  cd "${srcdir}"/otrtool-otrtool-*

  sed "s#/man/man1#/share/man/man1#g" -i Makefile
}

build() {
  cd "${srcdir}"/otrtool-otrtool-*

  make
}

package() {
  cd "${srcdir}"/otrtool-otrtool-*

  make PREFIX=/usr DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}

