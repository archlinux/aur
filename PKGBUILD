#
# PKGBUILD for IDE65XX
#
# Contributor: Uffe Jakobsen <microtop@starion.dk>
# Maintainer: Uffe Jakobsen <microtop@starion.dk>
#
_prjname=IDE65XX
pkgname=ide65xx-git
pkgver=r49.53212b8
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
source=("git+https://github.com/emartisoft/${_prjname}.git")
noextract=()
md5sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${_prjname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare()
{
  cd "${srcdir}/${_prjname}"
}

build()
{
  cd "${srcdir}/${_prjname}"
  qmake
  make
}

check()
{
  cd "${srcdir}/${_prjname}"
}

package()
{
  cd "${srcdir}/${_prjname}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0755 IDE65XX "${pkgdir}/usr/local/bin/IDE65XX"
  ln -s -f IDE65XX "${pkgdir}/usr/local/bin/IDE65xx"
  # desktop/icon
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo -e "[Desktop Entry]\nName=IDE 65XX\nComment=IDE 65XX Kick Assembler Edition\nExec=/usr/local/bin/IDE65xx\nIcon=ide65xx.png\nTerminal=false\nType=Application\nX-Ubuntu-Touch=true\n" > "${pkgdir}//usr/share/applications/IDE65XX.desktop"
  install -Dm644 icon/ide65xx.png "${pkgdir}/usr/share/icons/ide65xx.png"
}

#
# EOF
#
