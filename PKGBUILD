# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
# Contributor: ross <prwarren8 at gmail dot com>

pkgname=gabedit
pkgver=2.5.0
pkgrel=1
pkgdesc='A graphical user interface to computational chemistry packages'
arch=('i686' 'x86_64')
url='http://gabedit.sourceforge.net/'
license=('Custom')
depends=('gtkglext' 'gtk2')
_pkgver="${pkgver//\./}"
source=("http://prdownloads.sourceforge.net/gabedit/GabeditSrc$_pkgver.tar.gz" 
        'gabedit.desktop')

sha512sums=('c1caf916da81c68fb95f4477e69135ed52738a40427c825be33a4d024f809628fd40bbe153b02a95b01b16d2b3c8b45c8ac470c648003648ff24165af4390943' 
            'd9d2a7c6aab76ce3ba0ae11a8fd22ae7d3538dbc07221ff81fabf74fbcb57e51c788e31b1e255e99aab0618ed846a2cf3eea7083362151fb798be4fafdac0d4e')

build()
{
    cd "$srcdir/GabeditSrc$_pkgver/"
    cp platforms/CONFIG.unix CONFIG
    make
    #LDFLAGS+=/lib/libm.so.6 make
}
package()
{
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/licenses/gabedit"
    mkdir -p "$pkgdir/usr/share/applications/"
    
    install -D -m655 "$srcdir/GabeditSrc$_pkgver/gabedit" \
    "$pkgdir/usr/bin/"
    install -D -m644 "$srcdir/GabeditSrc$_pkgver/License" \
    "$pkgdir/usr/share/licenses/gabedit"
    
    # install .desktop file
    install -D -m644 "$srcdir/gabedit.desktop" \
    "$pkgdir/usr/share/applications/"
    install -D -m644 "$srcdir/GabeditSrc$_pkgver/icons/Gabedit48.png" \
    "$pkgdir/usr/share/pixmaps/gabedit.png"
}
