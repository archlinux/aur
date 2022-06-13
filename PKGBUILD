# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=easymorse-git
pkgver=601035b
pkgrel=1
pkgdesc="Simple crossplatform tool to learn morse code or automatic traffic on CW"
arch=('any')
license=('GPL3')
makedepends=('make' 'gcc' 'qt5-multimedia')
depends=('qt5-base')
url="https://bitbucket.org/Artemia/easymorse"
source=($pkgname::"git+$url.git")
sha256sums=('SKIP')
#fallback to qt5 version
prepare(){
    cd $srcdir/$pkgname
    git checkout $pkgver 
}

build(){
    cd $srcdir/$pkgname
    qmake CONFIG+=release
    make -j3
}

package() {
    cd $srcdir
    install -dm755 $pkgdir/usr/bin
    install -dm755 $pkgdir/opt/$pkgname
    cp -r $pkgname/* $pkgdir/opt/$pkgname
    cd $pkgdir/usr/bin
    ln -s ../../opt/$pkgname/easymorse ./easymorse
    echo -e "Done!\nAll the source files are located in /opt/$pkgname!"
}

