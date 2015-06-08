# Maintainer: Joermungand <joermungand at gmail dot com>

pkgname=loopauditioneer
pkgver=0.8.1.1
pkgrel=1
pkgdesc="Software for loop and cue handling in .wav files"
arch=('i686' 'x86_64')
url="http://loopauditioneer.sourceforge.net/"
license=('GPL3')
depends=('wxgtk2.8' 'alsa-lib')
provides=('loopauditioneer')
conflicts=('loopauditioneer')
source=("$pkgname.sh" "$pkgname.desktop")
md5sums=('1ea7cc51c813bfe8e37a7ebb15184948'
         '0e2286c155701065663461be6c1056ba')
if [[ $CARCH == 'i686' ]]; then
   source+=("${pkgname}::http://downloads.sourceforge.net/project/${pkgname}/${pkgname/loopa/LoopA}-0.8/${pkgname/loopa/LoopA}-${pkgver}-Linux-x86.tar.gz")
   md5sums+=('b4dadf709a2cffb8005e8f9631393500')
   _dirname="${pkgname/loopa/LoopA}-${pkgver}-Linux-x86"
elif [[ $CARCH == 'x86_64' ]]; then
   source+=("${pkgname}::http://downloads.sourceforge.net/project/${pkgname}/${pkgname/loopa/LoopA}-0.8/${pkgname/loopa/LoopA}-${pkgver}-Linux-amd64.tar.gz")
   md5sums+=('6bee529602189a47bd86a76e23f9d309')
   _dirname="${pkgname/loopa/LoopA}-${pkgver}-Linux-amd64"
fi

package() {
	cd "$srcdir"
	install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    cd "$srcdir/$_dirname"
    install -Dm755 bin/LoopAuditioneer "$pkgdir/opt/$pkgname/bin/LoopAuditioneer"
    install -dm755 bin/icons "$pkgdir/opt/$pkgname/bin/icons"
    install -Dm755 bin/icons/* "$pkgdir/opt/$pkgname/bin/icons/"
    install -Dm755 bin/help/help.zip "$pkgdir/opt/$pkgname/bin/help/zip"
    install -dm755 icons "$pkgdir/opt/$pkgname/icons"
    install -Dm755 icons/index.url "$pkgdir/opt/$pkgname/icons/index.url"
    install -Dm755 icons/readme.txt "$pkgdir/opt/$pkgname/icons/index.readme"
    install -dm755 icons/24x24 "$pkgdir/opt/$pkgname/icons/24x24"
    install -Dm755 icons/24x24/* "$pkgdir/opt/$pkgname/icons/24x24/"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README"
    cd "$pkgdir/usr/share/pixmaps"
    ln -s "../../../opt/$pkgname/bin/icons/LoopyIcon-48.png" "$pkgname.png"
 }

