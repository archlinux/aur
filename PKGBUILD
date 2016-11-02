# Maintainer: Hector Mercade Ramirez <hectormercade@gmail.com>
pkgname=overlap2d
pkgver=0.1.3
pkgrel=1
pkgdesc="Open minded editor for modern 2D games"
arch=('any')
url="http://overlap2d.com"
license=('Apache')
depends=('java-environment' 'xorg-xrandr' 'bash')
source=('http://overlap2d.com/bin/overlap2d.tar.gz'
        'overlap2d.desktop'
        'http://overlap2d.com/wp-content/themes/overlap2d-v3/img/logo.png')
md5sums=('41862a0f623f7dc17f4f3ddbe0f05c26'
         '8089e89b4d6e4fc55e4487da130d7165'
         '1577999c9e742b7259d57e3b0987c864')

build() {
  echo -e '#!/bin/sh' "\njava -jar /usr/share/java/overlap2d/overlap2D-${pkgver}.jar" > overlap2d
}

package() {
    install -d "$pkgdir"/usr/share/java/$pkgname/plugins

    cp -r examples "$pkgdir"/usr/share/java/$pkgname/
    find "$pkgdir" -type f -exec chmod 644 {} \;
    find "$pkgdir" -type d -exec chmod 755 {} \;

    install -m644 overlap2D-$pkgver.jar "$pkgdir"/usr/share/java/$pkgname/
    install -m644 plugins/* "$pkgdir"/usr/share/java/$pkgname/plugins/
    install -Dm755 overlap2d "$pkgdir"/usr/bin/overlap2d
    install -Dm644 overlap2d.desktop "$pkgdir"/usr/share/applications/overlap2d.desktop
    install -Dm644 logo.png "$pkgdir"/usr/share/pixmaps/overlap2d.png
}
