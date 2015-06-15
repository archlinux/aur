# Maintainer: Max Sydorenko <maxsydorenko at gmail dot com>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>
pkgname=zygrib
_upname=zyGrib # upstream, case-sensitive project name
pkgver=7.0.0
pkgrel=3
pkgdesc="Weather data visualization, GRIB file viewer"
arch=('i686' 'x86_64')
url="http://www.zygrib.org/"
license=('GPL3')
depends=('qt4>=4.5' 'bzip2' 'zlib>=1.2.3' 'proj>=4.6.0' 'ttf-liberation' 'libnova') #'qwt<6.1.0' 
optdepends=('zygrib-maps: gshhs high-resolution maps from zygrib.org')
source=($_upname-$pkgver.tgz::http://www.zygrib.org/getfile.php?file=$_upname-$pkgver.tgz \
	zyGrib_ARCH_0.1.patch
        zygrib.sh 
	zygrib.desktop
        zygrib.png) # creative commons licence
DLAGENTS=('http::/usr/bin/curl -fLC - --cookie nada -o /dev/null %u --next --cookie nada  --retry-delay 3 -o %o %u')
prepare() {
  cd "$srcdir/$_upname-$pkgver"
  msg "Please, read comments section here https://aur.archlinux.org/packages/zygrib/ before build"
# patch -p1 -i $srcdir/zyGrib_ARCH_0.1.patch # Qt4 path patched + system-wide qwt is used. qwt 6.0.x is required
}
build() {
  cd "$srcdir/$_upname-$pkgver"
  make INSTALLDIR=$pkgdir/opt/zygrib || return 1  
}

package() {
  install -d -m 755 $pkgdir/opt/$pkgname/{bin,data,data/colors,data/config,data/fonts/liberation-fonts,data/gis,data/img,data/maps/gshhs,data/stuff,data/tr}
  install -d -m 755 $pkgdir/usr/{bin,share/{applications,pixmaps}}
  install -D -m 755 $srcdir/zygrib.sh $pkgdir/usr/bin/zygrib
  install -D -m 644 $srcdir/zygrib.desktop $pkgdir/usr/share/applications
  install -D -m 644 $srcdir/zygrib.png $pkgdir/usr/share/pixmaps
  install -D -m 755 $srcdir/$_upname-$pkgver/src/$_upname $pkgdir/opt/$pkgname/bin
  install -D -m 644 $srcdir/$_upname-$pkgver/data/colors/* $pkgdir/opt/$pkgname/data/colors
install -D -m 644 $srcdir/$_upname-$pkgver/data/gis/* $pkgdir/opt/$pkgname/data/gis
install -D -m 644 $srcdir/$_upname-$pkgver/data/img/* $pkgdir/opt/$pkgname/data/img
install -D -m 644 $srcdir/$_upname-$pkgver/data/maps/gshhs/* $pkgdir/opt/$pkgname/data/maps/gshhs
install -D -m 644 $srcdir/$_upname-$pkgver/data/stuff/* $pkgdir/opt/$pkgname/data/stuff
install -D -m 644 $srcdir/$_upname-$pkgver/data/tr/* $pkgdir/opt/$pkgname/data/tr
}
sha256sums=('a8cf0192a5eef4a96bf8a37af81719300306ad53fc1e63a77fcb4269657b04c1'
            '7dd6cb3cfa3045d5a735f743b0c066c21a0ea4a2f6e22347311bad9897c49170'
            '57302878842678e4cc1f4fc25fac7f78ce87bfb24cfd7a46ccd9f99c6df32e5b'
            '2332353b1e681ffed5a189190c5ddf265336b064907cf2a0b085ba8d898a3ba1'
            '7f9034ad3a496d68cbc0e7423695840d525903e61bf8071b0db337db24e6141f')
sha256sums=('b60c1a318ba6afb4aec3ad1c241cfd6282e4fb5a34962c43fa2fb99aae1b9f53'
            '7dd6cb3cfa3045d5a735f743b0c066c21a0ea4a2f6e22347311bad9897c49170'
            '57302878842678e4cc1f4fc25fac7f78ce87bfb24cfd7a46ccd9f99c6df32e5b'
            '2332353b1e681ffed5a189190c5ddf265336b064907cf2a0b085ba8d898a3ba1'
            '7f9034ad3a496d68cbc0e7423695840d525903e61bf8071b0db337db24e6141f')
