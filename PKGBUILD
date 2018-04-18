# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=acetoneiso
pkgname=acetoneiso-qt5
pkgver=2.4
pkgrel=1
pkgdesc="An all in one ISO tool (bin mdf nrg img daa dmg cdi b5i bwi pdi iso)"
arch=('x86_64')
url="http://sourceforge.net/projects/acetoneiso"
license=('GPL3')
depends=('fuseiso' 'cdrdao' 'cdrkit' 'dvd+rw-tools' 'gnupg' 'pinentry' 'mplayer' 'phonon-qt5' 'qt5-webkit')
optdepends=("p7zip: for ISO compress/decompress support")
conflicts=('acetoneiso2')
install="${_pkgname}".install
source=("${_pkgname}"::'svn+https://svn.code.sf.net/p/acetoneiso/code/'
        '0001_port_to_qt5.patch'::'https://sourceforge.net/p/acetoneiso/bugs/_discuss/thread/0447d911/0e65/attachment/acetoneiso-2.4-qt5.patch'
        '0002_port_to_qt5.patch'::'https://sourceforge.net/p/acetoneiso/bugs/_discuss/thread/0447d911/ad42/attachment/acetoneiso-2.4-qttranslations.patch')
sha256sums=('SKIP'
            '7955163608a6fde644165eb109a4c66c080efe01bece55aa276ae750ce0ad738'
            '0889fb59b4284e4e3d79fc31052777cef5b67006031fbcfa334cff025e58e30d')

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 -i ../0001_port_to_qt5.patch
  patch -Np1 -i ../0002_port_to_qt5.patch
}

build() {
  cd "${srcdir}/${_pkgname}"/acetoneiso

  qmake
  make
}

package() {
  cd "${srcdir}/${_pkgname}"/acetoneiso

  make INSTALL_ROOT="${pkgdir}" install
}
