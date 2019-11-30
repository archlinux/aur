# Maintainer: Dimitris Pappas <mitsakosgr at gmail dot com>
# Contributor: Fabio Tardivo <x95a31x at gmail dot com>
pkgname=minizinc-ide
pkgver=2.3.2
pkgrel=1
pkgdesc="Simple IDE for writing and running MiniZinc models"
arch=(x86_64)
url=http://www.minizinc.org/ide/
license=(MPL2)
provides=(minizinc)
options=(!strip)
install=$pkgname.install
conflicts=(libminizinc)
source=(
    minizinc-ide.desktop
    fzn-gecode-gist-lib-path.patch
    https://raw.githubusercontent.com/MiniZinc/MiniZincIDE/master/resources/icon.png
    https://github.com/MiniZinc/MiniZincIDE/releases/download/$pkgver/MiniZincIDE-$pkgver-bundle-linux-$arch.tgz
)
sha256sums=(
    bf26b9e3cae148fb05ce131ef62076bda467ebd2ce9913525a5540f09435c2b6
    657090bd7d93d16648e12c8df14f65e858ee49c2384b137ff7e1abb61b291a6a
    eaa69a6d1b8a3e307d1b400b74273995abb914fbe1246c65fc9b3955b2094023
    ecb860f9c451c8680ffad278ec9107c75653ab3d887b5523492298d46ee3caf7
)


prepare() {
    # Workaround for https://github.com/MiniZinc/MiniZincIDE/issues/90
    cd $srcdir/MiniZincIDE-$pkgver-bundle-linux
    patch --strip=0 --input=${srcdir}/fzn-gecode-gist-lib-path.patch
}

package() {    
    # Create MiniZinc directory
    mkdir -p $pkgdir/opt/$pkgname   
    
    # Copy MiniZinc files    
    cp -r $srcdir/MiniZincIDE-$pkgver-bundle-linux/* $pkgdir/opt/$pkgname
    
    # Copy MiniZinc launcher
    mkdir -p $pkgdir/usr/share/applications
    cp $srcdir/icon.png $pkgdir/opt/$pkgname/resources/icon.png
    cp $srcdir/minizinc-ide.desktop $pkgdir/usr/share/applications/minizinc-ide.desktop
}
