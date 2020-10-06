#Maintainer: Skykey <zcxzxlc@163.com>

pkgname=('qtscrcpy-git')
pkgver=1.4.3
pkgrel=1
pkgdesc="Android real-time display control software."
provides=("qt-scrcpy")
conflicts=("qt-scrcpy")
url='https://github.com/barry-ran/QtScrcpy'
arch=('x86_64')
makedepends=('git')
depends=('qt5-base' 'android-tools' 'qt5-x11extras')
license=('Apache')
source=("git+https://github.com/barry-ran/QtScrcpy"
QtScrcpy.desktop
)
md5sums=(SKIP
SKIP
)

build(){
    cd "${srcdir}"/QtScrcpy
    
    mkdir -p build
    cd build
    qmake ../all.pro CONFIG+=qtquickcompiler
    make qmake_all
    sed -ie '/^CXXFLAGS/s/$/ -Wno-deprecated-declarations/' QtScrcpy/Makefile
    make
}

package(){
	 cd "${srcdir}"/QtScrcpy/output/linux/release
	 install -Dm755 QtScrcpy "${pkgdir}"/usr/bin/QtScrcpy
	 
	 cd "${srcdir}"
	 install -Dm644 QtScrcpy.desktop "${pkgdir}"/usr/share/applications/QtScrcpy.desktop
	 install -Dm644 QtScrcpy/backup/logo.png "${pkgdir}"/usr/share/pixmaps/QtScrcpy.png
	 
	 install -Dm644 QtScrcpy/third_party/scrcpy-server "${pkgdir}"/usr/bin/scrcpy-server
}
