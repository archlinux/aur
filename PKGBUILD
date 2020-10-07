# Maintainer: Dimitris Pappas <mitsakosgr at gmail dot com>
# Contributor: Fabio Tardivo <x95a31x at gmail dot com>
pkgname=minizinc-ide
pkgver=2.5.0
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
    e0bca68c0897cbcd63bf603ad1f352c16c5fc62ee8f151daa7e793361007d242
    80ab03ebe936ce85b107523ae242d97905763ed30596639e1778cdea796b9e1e
    eaa69a6d1b8a3e307d1b400b74273995abb914fbe1246c65fc9b3955b2094023
    4fc4c7fd7d5aef2409d94a6e7f5f60564d068b34e329a6976e9feaabeb15fd8c
)

prepare() {
    # Workaround for https://github.com/MiniZinc/MiniZincIDE/issues/90
    cd $srcdir/MiniZincIDE-$pkgver-bundle-linux-$arch
    patch --strip=0 --input=${srcdir}/fzn-gecode-gist-lib-path.patch
}

package() {    
    # Create MiniZinc directory
    mkdir -p $pkgdir/opt/$pkgname   
    
    # Copy MiniZinc files    
    cp -r $srcdir/MiniZincIDE-$pkgver-bundle-linux-$arch/* $pkgdir/opt/$pkgname
    
    # Copy MiniZinc launcher
    mkdir -p $pkgdir/usr/share/applications
    cp $srcdir/icon.png $pkgdir/opt/$pkgname/resources/icon.png
    cp $srcdir/minizinc-ide.desktop $pkgdir/usr/share/applications/minizinc-ide.desktop
}
