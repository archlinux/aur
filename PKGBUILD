# Maintainer: ramen <hendrik@hndrkk.sh>
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Mike WB2FKO <mph at sportscliche dot com>
pkgname=quisk
pkgver=4.2.9
pkgrel=1
pkgdesc="Software defined radio (SDR)"
arch=('i686' 'x86_64')
url="http://james.ahlstrom.name/quisk/"
license=('GPL')
depends=('python' 'fftw' 'portaudio' 'python-wxpython')
optdepends=('codec2: Enable digital voice communication with FreeDV')
source=(https://files.pythonhosted.org/packages/de/3d/9500e98d1a250189b29023e08209879947fd920f4176e8ece480e705f956/$pkgname-$pkgver.tar.gz 
    quisk 
    quisk.desktop)
sha512sums=('99ceef2e9c09a893d9e9f905665df4c9da48a8bbd91b7c394111d62a4a406c85e1eead092d0e8e4268d5c0f5d6c82c923087f67d4c36e920ef3f015d160fccd8'
            '58b0146411411301ffcbf3f71081b2a421d0c0e0d3e33c16d2e8d0d9786b249999609c0f4f4d5ed68c217d343a88230af49947d99621def8ec45ec0861135a07'
            '3ad02f730b4a4033b86a2ce510865c13c2f2e228304283cae0bb389442f7ab49a5d530cd94e32460e19b53da24037abc855027ce34c93fdabcd1faf8a91852b1')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build_ext --force --inplace
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
