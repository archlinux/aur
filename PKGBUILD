# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=tastyworks
pkgver=0.27.0
pkgrel=2
pkgdesc="One of the fastest, most reliable, and most secure trading platforms in the world."
arch=('x86_64')
url="https://tastyworks.com/technology.html"
license=('Other')
depends=('java-runtime'  'lib32-glibc'      'lib32-gcc-libs'
         'lib32-libx11'  'lib32-libxext'    'lib32-libxi'  
         'lib32-libxtst' 'lib32-libxrender' 'lib32-alsa-lib')
source=("https://download.tastyworks.com/desktop/$pkgver/$pkgname-$pkgver.rpm"
        "tastyworks.png")
sha256sums=('1e512ea67dc99f0a1108764c960a47e1f4e97ff51c7a62a386843611c22d1965'
            'f47e738b37d5e804ce62581acaabe41efdd8a6f626a396a02b10714ddd1e1f5b')

# I'm not sure that the all the lib32 stuff is actually needed. The application seemed to be working
# fine without it but the "official" install requested those packages. I'll leave them there for
# now but need to contact tastyworks team for clarification and do some more research.

package() {

    cd "$srcdir"

    install -d      "$pkgdir/opt/$pkgname"
    cp      -r      "$srcdir/opt/$pkgname/"                                   "$pkgdir/opt/"

    sed     -i      's|Name=tastyworks|Name=TastyWorks|'                      "$srcdir/opt/$pkgname/$pkgname.desktop"
    sed     -i      's|Comment=tastyworks|Comment=Trading Platform|'          "$srcdir/opt/$pkgname/$pkgname.desktop"
    sed     -i      's|Icon=/opt/tastyworks/tastyworks.png|Icon=tastyworks|'  "$srcdir/opt/$pkgname/$pkgname.desktop"
    sed     -i      's|Categories=Unknown|Categories=Internet|'               "$srcdir/opt/$pkgname/$pkgname.desktop"

    install -Dm 644 "$srcdir/opt/$pkgname/$pkgname.desktop"                   "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm 644 "$pkgname.png"                                            "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
