# Maintainer: scorici <scorici AT yahoo DOT com>
pkgname=fics-timeseal
pkgver=1
pkgrel=4
pkgdesc="Timeseal support for eboard, xboard, scid and maybe others for playing chess on FICS"
arch=(any)
url="http://www.freechess.org/"
license=('unknown')
install=$pkgname.install
optdepends=('eboard: works automagically' \
            'xboard: run fics-xboard-timeseal from a terminal' \
            'scid:   before connecting browse and select /usr/bin/timeseal')
source=("http://sourceforge.net/p/scidvspc/code/HEAD/tree/timeseal/timeseal.Linux-i386?format=raw")
md5sums=('b30dd4fafb3ac1c87804e0ab2fc7bdd7')
package() {
mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/eboard
cp timeseal.Linux-i386\?format=raw $pkgdir/usr/bin/timeseal
echo "#!/bin/bash
if [ -a /usr/bin/xboard ];then
xboard -ics -icshost 69.36.243.188 -telnet -telnetProgram timeseal
echo 
echo 
echo Connection to freechess.org lost\!
echo If you were in the middle of a game reconnect to resume it.
else echo xboard is not installed on your system
fi
" > $pkgdir/usr/bin/fics-xboard-timeseal
chmod +x $pkgdir/usr/bin/*timeseal
ln -s /usr/bin/timeseal $pkgdir/usr/share/eboard/timeseal.Linux
}
