# Maintainer: Guillermo Ramos <0xwille at gmail dot com>

pkgname="pentbox"
pkgver=1.5
pkgrel=7
pkgdesc="A security suite that packs security and stability testing oriented tools for networks and systems."
arch=(any)
url="https://sourceforge.net/projects/pentbox/"
license=('GPL3')
depends=(ruby)
optdepends=('hping: TCP SYN flood with hping3')
options=(!strip)
source=("http://sourceforge.net/projects/pentbox/files/$pkgver/$pkgname-$pkgver.tar/download"
        "launcher.sh")
md5sums=("ec073e657923e3fde8bf15c5ab1e53fe"
         "c93d1d00bbedba174fa2d6fea8b32b3c")
sha256sums=("cb2cb605453e68a3fe9e53369d32d6985991d2243d8bd03429c150f070e3982e"
            "c473d132034b58413a78016238f38288eca18ab7d4f0adf3ad70793379637c42")

package() {
    # Install to /opt/pentbox
    mkdir -p $pkgdir/opt/$pkgname
    cp -R $srcdir/$pkgname-$pkgver/* $pkgdir/opt/$pkgname/
    rm -rf $(find $pkgdir/opt/$pkgname/ -type d -name .svn)

    # Install launcher
    install -D -m755 launcher.sh $pkgdir/usr/bin/$pkgname

    # Fix permissions
    chmod -R 755 $pkgdir/opt/$pkgname
    find $pkgdir/opt/$pkgname -type f -name "*.txt" -exec chmod 644 {} \;
}
