# Maintainer: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=kwalletcli
pkgver=3.02
pkgrel=1
pkgdesc="Command-Line Interface for the KDE Wallet"
url="https://www.mirbsd.org/kwalletcli.htm"
license=('custom:MirOS' 'LGPL3')
arch=('i686' 'x86_64')
depends=('kwallet' 'mksh')
source=("https://www.mirbsd.org/MirOS/dist/hosted/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('26e598ca44ee3846d4d458edd8b15f1d2739bec32451e46114602f959cece471f614e869536aad7a55709d1a3165c1043444f1064aa86bd0cd02e855968dd415')

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
