# Maintainer: Dimitris Pappas <mitsakosgr at gmail dot com>
# Contributor: Fabio Tardivo <x95a31x at gmail dot com>
pkgname=minizinc-ide-edge
pkgver=0000
pkgrel=1
pkgdesc="Simple IDE for writing and running MiniZinc models"
arch=(x86_64)
url=http://www.minizinc.org/ide/
license=(MPL2)
provides=(minizinc)
options=(!strip)
install=$pkgname.install
conflicts=(
	libminizinc
	minizinc-ide
)
source=(
    minizinc-ide-edge.desktop
    https://raw.githubusercontent.com/MiniZinc/MiniZincIDE/master/resources/icon.png
    https://github.com/MiniZinc/MiniZincIDE/releases/download/edge/MiniZincIDE-$pkgver-bundle-linux-$arch.tgz
)

# Workaround for https://github.com/MiniZinc/MiniZincIDE/issues/90
# implemented in .desktop file, by adding it as environment variable

package() {    
    # Create MiniZinc directory
    mkdir -p $pkgdir/opt/$pkgname   
    
    # Copy MiniZinc files    
    cp -r $srcdir/MiniZincIDE-$pkgver-bundle-linux-$arch/* $pkgdir/opt/$pkgname
    
    # Copy MiniZinc launcher
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/opt/$pkgname/resources
    cp $srcdir/icon.png $pkgdir/opt/$pkgname/resources/icon.png
    cp $srcdir/minizinc-ide-edge.desktop $pkgdir/usr/share/applications/minizinc-ide-edge.desktop
}




