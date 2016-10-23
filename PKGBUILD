# Maintainer: Hector Mercade Ramirez <hectormercade@gmail.com>
pkgname=overlap2d
pkgver=0.1.3
pkgrel=0
pkgdesc="Overlap2D"
arch=('any')
url="http://overlap2d.com"
license=('APACHE2')
depends=('java-environment', 'xorg-xrandr')
source=('http://overlap2d.com/bin/overlap2d.tar.gz'
    'overlap2d.desktop'
    'http://overlap2d.com/wp-content/themes/overlap2d-v3/img/logo.png')
md5sums=('41862a0f623f7dc17f4f3ddbe0f05c26'
     '8089e89b4d6e4fc55e4487da130d7165'
     '1577999c9e742b7259d57e3b0987c864')
 
build() {
  cd $srcdir
  echo -e '#!/bin/sh' "\njava -jar /usr/share/java/overlap2d/overlap2D-${pkgver}.jar" > overlap2d
}
 
package() {
    cd $srcdir
 
    tar -xvf overlap2d.tar.gz
    mkdir -p $pkgdir/usr/share/java/$pkgname
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    install -Dm755 overlap2D-$pkgver.jar $pkgdir/usr/share/java/$pkgname/
    install -dDm755 examples $pkgdir/usr/share/java/$pkgname/
    install -dDm755 plugins $pkgdir/usr/share/java/$pkgname/
    install -Dm755 overlap2d $pkgdir/usr/bin
    install -Dm755 overlap2d.desktop $pkgdir/usr/share/applications/
    install -Dm755 logo.png $pkgdir/usr/share/pixmaps/overlap2d.png
    #make DESTDIR="$pkgdir/" install
}
