# Maintainer: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=kwalletcli
pkgver=3.00
pkgrel=1
pkgdesc="Command-Line Interface for the KDE Wallet"
url="https://www.mirbsd.org/kwalletcli.htm"
license=('custom:MirOS' 'LGPL3')
arch=('i686' 'x86_64')
depends=('kwallet' 'mksh')
source=("https://www.mirbsd.org/MirOS/dist/hosted/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha1sums=('3f93e4c9a6a66fd9d503c6e33809f2c99c2fc725')

build() {
  cd "${srcdir}"/${pkgname}
  sed -i -e 's/CPPFLAGS+=	${KDE_INCS} -D_GNU_SOURCE/CPPFLAGS+=	${KDE_INCS} -fPIC -D_GNU_SOURCE/' GNUmakefile
  make KDE_VER=5
}

package() {
  cd "${srcdir}"/${pkgname}
  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  for F in kwalletaskpass kwalletcli kwalletcli_getpin pinentry-kwallet; do
    install ${F} "${pkgdir}"/usr/bin/${F}
    install -m644 ${F}.1 "${pkgdir}"/usr/share/man/man1/${F}.1
  done
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE
}
