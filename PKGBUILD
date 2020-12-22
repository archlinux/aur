 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=breezemite-yakuake-git
pkgver=0.2
pkgrel=1
pkgdesc="Yakuake recompiled with Brezemite themes"
arch=('x86_64')
url="https://github.com/matijaskala/breezemite-yakuake"
license=('GPL2')
depends=('konsole' 'knewstuff' 'kwayland' 'hicolor-icon-theme')
conflicts=('yakuake' 'yakuake-git')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("git+${url}.git"
        "git+https://invent.kde.org/utilities/yakuake.git")
sha256sums=('SKIP'
            'SKIP')
             



prepare() {
   cd ${srcdir}/yakuake
   sed -i 's/\(Button->move(\)\(width() - \)\(m_skin->titleBar.*ButtonPosition().x()\)\(, m_skin->titleBar\)/\1(\3 <= 0) ? (- \3) : (\2\3)\4/' app/titlebar.cpp       

}

build() {
  cd ${srcdir}/yakuake
  mkdir -p build && cd build
   
  cmake .. \
    -DCMAKE_BUILD_TYPE=Master \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
        
   make
  

}

package() {
make -C ${srcdir}/yakuake/build DESTDIR="${pkgdir}" install
mkdir -p  ${pkgdir}/usr/share/yakuake/skins/{breezemite,breezemite_dark,breezemite_dark_rhs}
cp -r ${srcdir}/breezemite-yakuake/{breezemite,breezemite_dark,breezemite_dark_rhs} ${pkgdir}/usr/share/yakuake/skins/

}


