# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=monsters_and_mushrooms
pkgver=1
pkgrel=6
pkgdesc="A Millipede remake written in Python using Pygame."
arch=('i686')
url="http://machineinteractive.com/projects/projects.html"
license=("GPL-2")
source=("http://machineinteractive.com/projects/downloads/${pkgname}.tar.gz" "${pkgname}.desktop")
md5sums=('733296046c7d27d70d1e06cc6167293a'
         '106a7a4738e9db5075fa96895e93ed48')
depends=('python2' 'python-pygame')

build() {
cd $srcdir/monsters_and_mushrooms
sed -i '1s/python/python2/' game.py
sed -i '1s/python/python2/' animtest.py
}

package() {
cd $srcdir/monsters_and_mushrooms
mkdir -p $pkgdir/usr/{share/monsters_and_mushrooms/data/{images,sounds,sprites},bin}
chmod 775 $pkgdir/usr/share/monsters_and_mushrooms
install -Dm 644 data/images/* $pkgdir/usr/share/monsters_and_mushrooms/data/images
install -Dm 644 data/sounds/* $pkgdir/usr/share/monsters_and_mushrooms/data/sounds
install -Dm 644 data/sprites/* $pkgdir/usr/share/monsters_and_mushrooms/data/sprites
install -Dm 644 README.txt $pkgdir/usr/share/monsters_and_mushrooms/README.txt
install -Dm 644 gpl.txt $pkgdir/usr/share/monsters_and_mushrooms/gpl.txt
install -Dm 755 animtest.py $pkgdir/usr/share/monsters_and_mushrooms/animtest.py
install -Dm 755 game.py $pkgdir/usr/share/monsters_and_mushrooms/game.py
echo "#!/bin/sh
cd /usr/share/monsters_and_mushrooms
./game.py" > $pkgdir/usr/bin/monsters_and_mushrooms
chmod 755 $pkgdir/usr/bin/monsters_and_mushrooms
install -Dm 644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
