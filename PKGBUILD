 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=breezemite-yakuake-git
pkgver=0.1
pkgrel=1
pkgdesc="Yakuake recompiled with Brezemite themes"
arch=('x86_64')
url="https://github.com/matijaskala/breezemite-yakuake"
license=('GPL2')
depends=('konsole' 'knewstuff' 'kwayland' 'hicolor-icon-theme')
conflicts=('yakuake' 'yakuake-git')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'ruby' 'subversion')
source=("git+${url}.git"
        "git+git://anongit.kde.org/yakuake.git")
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
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DKDE_L10N_BRANCH=trunk \
    -DKDE_L10N_AUTO_TRANSLATIONS=OFF \
    
   make fetch-translations
   make
  

}

package() {
make -C ${srcdir}/yakuake/build DESTDIR="${pkgdir}" install
mkdir -p  ${pkgdir}/usr/share/yakuake/skins/{breezemite,breezemite_dark,breezemite_dark_rhs}
cp -r ${srcdir}/breezemite-yakuake/{breezemite,breezemite_dark,breezemite_dark_rhs} ${pkgdir}/usr/share/yakuake/skins/

}


