# Maintainer: Jeffrey Bouter (kyentei) <aur@kn0x.org>
# Previous maintainer: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=kwalletcli
pkgver=3.03
pkgrel=1
pkgdesc="Command-Line Interface for the KDE Wallet"
url="https://www.mirbsd.org/kwalletcli.htm"
license=('custom:MirOS' 'LGPL3')
arch=('i686' 'x86_64')
depends=('kwallet' 'mksh')
source=("https://www.mirbsd.org/MirOS/dist/hosted/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('237d427f87f2d313378aacfdb056c658f0a51fda3a8592d24792916d14efc462153aa0f9ebabdcf38375824f349208db367be6f369f3f7c9c1fea8187f787bfa')

build() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's/CPPFLAGS+=       ${KDE_INCS} -D_GNU_SOURCE/CPPFLAGS+=    ${KDE_INCS} -fPIC -D_GNU_SOURCE/' GNUmakefile
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

