# Maintainer: Dimitris Pappas <mitsakosgr at gmail dot com>
# Contributor: Fabio Tardivo <x95a31x at gmail dot com>
pkgname=minizinc-ide-edge
pkgver=build1091618825
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

sha256sums=('484be8e67fe0612d1cc7c2cc02434ddf78f73074425d080a928572e59e1f5554'
            'eaa69a6d1b8a3e307d1b400b74273995abb914fbe1246c65fc9b3955b2094023'
            '2736dc331626c644c68f045b35af35b054b30550078e2db37f79dfdda742429f')
