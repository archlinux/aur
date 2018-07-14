# Maintainer : oltulu <cihanalk@gmail.com>
pkgname=ay-gaste
pkgver=0.3
pkgrel=1
pkgdesc="Online gazete okuma programı"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt5-base' 'exempi')
makedepends=('git' 'qt5-base')

url='https://notabug.org/oltulu/Ay-Gaste'

source=("${pkgname}::git+https://notabug.org/oltulu/Ay-Gaste.git")
md5sums=('SKIP')

prepare() {
    cd ${srcdir}/${pkgname}
}

build() {
cd ${srcdir}/${pkgname}
qmake-qt5 ay-gaste.pro -spec linux-g++ CONFIG+=debug CONFIG+=qml_debug 
make
}

package(){
    cd ${srcdir}/${pkgname}
    make DESTDIR="$pkgdir/" install
    

# Başlatıcı 
mkdir -pv $pkgdir/usr/share/applications &&
cat > $pkgdir/usr/share/applications/$pkgname.desktop << "EOF" &&
#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Name=Gazete Oku
Comment=Online Gazete Oku
Icon=/usr/share/icons/ay-gaste.png
Exec=ay-gaste
Terminal=false
Categories=Graphics;
Keywords=gazete;gaste;oku;
Name[tr_TR]=Gazete Oku
Path=
StartupNotify=false
EOF
    cd ${srcdir}/${pkgname}
    mkdir -pv $pkgdir/usr/bin
    cp ${pkgname} $pkgdir/usr/bin/
    mkdir -pv $pkgdir/usr/share/icons
    cp ${pkgname}.png $pkgdir/usr/share/icons/
    mkdir -pv $pkgdir/usr/share/ay-gaste
    cp -r logo $pkgdir/usr/share/ay-gaste/
    cp yerel $pkgdir/usr/share/ay-gaste/
    cp ulusal $pkgdir/usr/share/ay-gaste/

}
