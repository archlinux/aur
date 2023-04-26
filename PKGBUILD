# Maintainer: Dimitris Pappas <mitsakosgr at gmail dot com>
# Contributor: Fabio Tardivo <x95a31x at gmail dot com>
pkgname=minizinc-ide
pkgver=2.7.3
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
    https://raw.githubusercontent.com/MiniZinc/MiniZincIDE/master/resources/icon.png
    https://github.com/MiniZinc/MiniZincIDE/releases/download/$pkgver/MiniZincIDE-$pkgver-bundle-linux-$arch.tgz
)

sha256sums=('9928044890140a0f0e6f17df8b5f11acfea0b4fd7a8f494309a38b37bb7d71c2'
            'eaa69a6d1b8a3e307d1b400b74273995abb914fbe1246c65fc9b3955b2094023'
            '947247aa1431e2470667ed084601ad00e3a6cce3dc3f3cd7aeee186743633c93')

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
    cp $srcdir/minizinc-ide.desktop $pkgdir/usr/share/applications/minizinc-ide.desktop
}
