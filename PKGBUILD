# Maintainer: Robert F. Nash <robert@robertnash.net>
pkgname=passwordsafe-debian
pkgver=0.93BETA
pkgrel=1
pkgdesc="Simple and secure password manager, from Debian package"
arch=('i686' 'x86_64')
url="http://passwordsafe.sourceforge.net"
license=('Artistic License 2.0')
conflicts=('pwsafe' 'pwsafe-cvs')
provides=('pwsafe' 'passwordsafe')
depends=('xerces-c' 'wxgtk2.8' 'ykpers')
install="$pkgname.install"
source=(http://downloads.sourceforge.net/project/passwordsafe/Linux-BETA/0.93/passwordsafe-debian-0.93BETA.i686.deb)
md5sums=('e747fa099a0b8c4c4371054448fb77d4')

[ "$CARCH" = "x86_64" ] && source=(http://downloads.sourceforge.net/project/passwordsafe/Linux-BETA/0.93/passwordsafe-debian-0.93BETA.amd64.deb)
[ "$CARCH" = "x86_64" ] && md5sums=('4bef42d2e3cccb5ddd6f8fae4eef5cf8')


package() {
    cd "$srcdir"
    if [ "$CARCH" = "x86_64" ]; then
        ar x $pkgname-$pkgver.amd64.deb
    else
        ar x $pkgname-$pkgver.$arch.deb
    fi
    tar xzf data.tar.gz -C "$pkgdir/"
    cd "$pkgdir/usr/share"
    mkdir -p applications
    mkdir -p pixmaps
    cp pwsafe/pwsafe.desktop applications/
    cp pwsafe/pwsafe.png pixmaps/
}
