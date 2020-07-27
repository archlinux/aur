#
# PKGBUILD for IDE65XX
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
_prjname=IDE65XX
pkgname=ide65xx
pkgver=0.1.4
pkgrel=1
epoch=
pkgdesc="IDE for 6502, 6510, C64 projects uses Kick Assembler"
arch=('i686' 'x86_64')
url="https://sites.google.com/view/ide65xx"
license=('GPL3')
groups=()
depends=('qt5-base')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/emartisoft/${_prjname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('7083b8c21089a2fa8ff1498d2eb55f7d')


prepare()
{
  cd "${srcdir}/${_prjname}-${pkgver}"
}

build()
{
  cd "${srcdir}/${_prjname}-${pkgver}"
  qmake
  make
}

check()
{
  cd "${srcdir}/${_prjname}-${pkgver}"
}

package()
{
  cd "${srcdir}/${_prjname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0755 IDE65XX "${pkgdir}/usr/local/bin/IDE65XX"
  ln -s -f IDE65XX "${pkgdir}/usr/local/bin/IDE65xx"
  # desktop/icon
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo -e "[Desktop Entry]\nName=IDE 65XX\nComment=IDE 65XX Kick Assembler Edition\nExec=/usr/local/bin/IDE65xx\nIcon=ide65xx.png\nTerminal=false\nType=Application\nX-Ubuntu-Touch=true\n" > "${pkgdir}/usr/share/applications/IDE65XX.desktop"
  install -Dm644 icon/ide65xx.png "${pkgdir}/usr/share/icons/ide65xx.png"
}

#
# EOF
#
