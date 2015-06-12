# Contributor: mpie <michael.kyne-phillips@sky.com>
# Maintainer: jose riha <jose 1711 gmail. com>

pkgname=pydance
pkgver=1.1.0
pkgrel=1
pkgdesc="python ddr game"
url="http://icculus.org/pyddr/"
arch=('i686')
license=('GPL')
depends=('python2-pygame')
source=(http://icculus.org/pyddr/$pkgname-$pkgver.tar.gz
http://icculus.org/pyddr/6jan-banner.png 
http://icculus.org/pyddr/6jan-bg.jpg
http://icculus.org/pyddr/6jan.ogg
http://icculus.org/pyddr/6jan.dance
http://icculus.org/pyddr/forkbomb-banner.png
http://icculus.org/pyddr/forkbomb-bg.jpg
http://icculus.org/pyddr/forkbomb.ogg
http://icculus.org/pyddr/forkbomb.dance
http://icculus.org/pyddr/synrg-bg.png
http://icculus.org/pyddr/synrg.dance
http://icculus.org/pyddr/synrg.ogg
)
md5sums=('b509dbcd29630f8fb96559c55a995402'
         '8293cc45536dcad3e6e0ccf15974527f'
         'a290e913ece03317a46ff77cb7986a1d'
         '1d854704c96c9af57517390b37765627'
         '4bdd8d369fd5aef577a614316c0de61a'
         '20d27c6cd45f2bbd4b12d8a1f211d501'
         'f440c9820c5a3604f5f93be64bef7e9f'
         '0ca7527a0b792fe0b597322d69e675d7'
         'e62aab2b2d39adf172a74d229acedb23'
         '89baa4d0af462938256222269412df33'
         '70156d4215aa26ad2a823a36a12a7627'
         '66df8b9049aad5bb3a1689a7943e9108')
build() {
cd ${srcdir}/$pkgname-$pkgver
find . -type f -perm 600 -exec chmod 644 '{}' \;
find . -type f -name "*py" -exec sed -i 's/env python/&2/' '{}' \;
python2 setup.py 
}

package() {
mkdir -p ${pkgdir}/etc
cd ${srcdir}/$pkgname-$pkgver
make  install DESTDIR=${pkgdir} PREFIX=/usr
rm -fr ${pkgdir}/usr/games
install -D -m755 desktop.pydance ${pkgdir}/usr/share/applications/pydance.desktop
install -D -m644 icon.png ${pkgdir}/usr/share/pixmaps/pydance.png
install -D -m755 pydance.py ${pkgdir}/usr/bin/pydance
cd $srcdir
cp *.ogg *.dance *.png *.jpg ${pkgdir}/usr/share/games/pydance/songs/
rm $pkgdir/usr/bin/pydance
ln -s /usr/share/games/pydance/pydance.py $pkgdir/usr/bin/pydance
}
