# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Mike WB2FKO <mph at sportscliche dot com>
pkgname=quisk
pkgver=4.1.39
pkgrel=1
pkgdesc="Software defined radio (SDR)"
arch=('i686' 'x86_64')
url="http://james.ahlstrom.name/quisk/"
license=('GPL')
depends=('python2' 'fftw' 'portaudio' 'wxpython')
optdepends=('codec2: Enable digital voice communication with FreeDV')
source=(https://files.pythonhosted.org/packages/68/2e/d1c54234035b823c1b1a72c3a6cb31b15420971fd838cf1bdd55508873d3/quisk-4.1.39.tar.gz
        $pkgname
        $pkgname.desktop)
sha512sums=('ed4bdcb9fff6ae4875e89af1feda49b57a70ac53565d8e9f0d5651bddf740ede1d3add728ea446c91f51a7636eebe7292e9d3d4fafc52a7de4070ba97682cebd'
            '94f09cc0e847e308ca66bf90c8f729924273f66524fed8bc63565c8060113ae8dcae6ed3f14075e03a7168da182059b3279c0315a1d2d00cf4292e4d68cf7871'
            '3ad02f730b4a4033b86a2ce510865c13c2f2e228304283cae0bb389442f7ab49a5d530cd94e32460e19b53da24037abc855027ce34c93fdabcd1faf8a91852b1')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build_ext --force --inplace
}

package() {
    mkdir -p $pkgdir/opt/$pkgname
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 quisk $pkgdir/opt/$pkgname/quisk
    cp -ra *.h $pkgdir/opt/$pkgname
    cp -ra *.c $pkgdir/opt/$pkgname
    cp -ra *.html $pkgdir/opt/$pkgname
    cp -ra *.py $pkgdir/opt/$pkgname
    cp -ra *.so $pkgdir/opt/$pkgname
    cp -ra *.txt $pkgdir/opt/$pkgname
#   mv charleston "$pkgdir/opt/$pkgname"
    mv n2adr "$pkgdir/opt/$pkgname"
    mv sdriqpkg "$pkgdir/opt/$pkgname"
    mv softrock "$pkgdir/opt/$pkgname"
#    mv usb "$pkgdir/opt/$pkgname"
    mv hiqsdr "$pkgdir/opt/$pkgname"
    mv hermes "$pkgdir/opt/$pkgname"
    find "$pkgdir/opt/$pkgname/" -type f  | xargs chmod 644
    find "$pkgdir/opt/$pkgname/" -type d | xargs chmod 755
    cd $srcdir
    mkdir -p $pkgdir/usr/share/applications
#   If the working directory is moved (e.g. from /opt to /home) 
#   the following .desktop file will have to be edited. Developer
#   has not provided a launcher icon.
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    echo -e "\n Quisk will be installed in the /opt directory of root \n"
    mkdir -p $pkgdir/usr/bin
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
