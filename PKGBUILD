# Maintainer: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=kwalletcli
pkgver=3.01
pkgrel=1
pkgdesc="Command-Line Interface for the KDE Wallet"
url="https://www.mirbsd.org/kwalletcli.htm"
license=('custom:MirOS' 'LGPL3')
arch=('i686' 'x86_64')
depends=('kwallet' 'mksh')
source=("https://www.mirbsd.org/MirOS/dist/hosted/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('2cd90203c4a8620b900eb1075522352ed13a0a72d7adac418292e18920aaa3e0bc407743ff8a4510902888e570212b09e739e2c55bf54ffc090b5759cc7d0edc')

build() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's/CPPFLAGS+=	${KDE_INCS} -D_GNU_SOURCE/CPPFLAGS+=	${KDE_INCS} -fPIC -D_GNU_SOURCE/' GNUmakefile
  make KDE_VER=5
}

package() {
  cd "${srcdir}/${pkgname}"
  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  for F in kwalletaskpass kwalletcli kwalletcli_getpin pinentry-kwallet; do
    install ${F} "${pkgdir}"/usr/bin/${F}
    install -m644 ${F}.1 "${pkgdir}"/usr/share/man/man1/${F}.1
  done
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENCE
}
