# Maintainer: Axel Navarro <navarroaxel [at] gmail>
pkgbase=aqua
pkgname=(aqua aqua-jre)
pkgver=2024.2.1
_pkgver=242.22855.128
pkgrel=1
pkgdesc="A powerful IDE for test automation by JetBrains."
arch=('x86_64')
options=('!strip')
url="https://www.jetbrains.com/aqua"
license=("custom")
source=("https://download-cdn.jetbrains.com/$pkgname/$pkgname-$pkgver.tar.gz"
	"jetbrains-aqua.desktop")
sha256sums=('847b7658843dd06b9d6f2689fa4030e54473b6e5e234f23b6e17a6c646fad07c'
            'a4b2d449968a8603addd4405af25ca110658059292464855c3ebded68b46d4d3')

prepare() {
    cd $srcdir/$pkgname-$_pkgver

    rm Install-Linux-tar.txt
}
  
package_aqua() {
    optdepends=('aqua-jre: JetBrains custom Java Runtime (Recommended)'
                'java-runtime: JRE - Required if aqua-jre is not installed')
  
    cd $srcdir
    mkdir -p $pkgdir/opt/$pkgname
    cp --recursive $srcdir/$pkgname-$_pkgver/* $pkgdir/opt/$pkgname
    rm -rf $pkgdir/opt/$pkgbase/jbr
  
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
  
    install -m 644 jetbrains-$pkgname.desktop $pkgdir/usr/share/applications
    install -m 644 $pkgdir/opt/$pkgname/bin/$pkgname.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
  
    ln -s /opt/$pkgname/bin/$pkgname $pkgdir/usr/bin/$pkgname
}

package_aqua-jre() {
    pkgdesc="JBR (JetBrains Runtime) for Aqua - a patched JRE"
    url='https://github.com/JetBrains/JetBrainsRuntime'

    install -dm755 $pkgdir/opt/$pkgbase
    cp -a $srcdir/$pkgbase-$_pkgver/jbr $pkgdir/opt/$pkgbase
}
