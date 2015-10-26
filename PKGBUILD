# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: Christoph Zeiler <rabyte@gmail.com>

pkgname=pymo
pkgver=20151026
pkgrel=1
pkgdesc="An AVG game engine for mobile devices"
arch=('any')
url="http://pymo.github.io/"
license=('MIT')
depends=('python2' 'python2-pygame')
source=("git+https://github.com/pymo/pymo.git")
md5sums=('SKIP')
install=pymo.install

package() {
  cd "$pkgname"
  install -dm755 "$pkgdir/"{/usr/bin,/opt}
  cp -r pc "$pkgdir/opt/pymo"
  echo \
'#!/bin/sh
mkdir -p ~/.pymo
cd ~/.pymo
[ -f ~/.pymo/globalconfig.txt ] || cp /opt/pymo/globalconfig.txt ~/.pymo/
ls /opt/pymo | while read line
do
    [ -f ~/.pymo/$line ] || ln -s /opt/pymo/$line ~/.pymo/$line
done
python2 main.py' > "$pkgdir/usr/bin/pymo"
  chmod +x "$pkgdir/usr/bin/pymo"
}
