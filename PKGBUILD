# Contributor: Philipp Schmitt (attentah@NOSPAM.gmail.com)

pkgname=phoebetria
pkgver=1.4
pkgrel=1
pkgdesc="Controller software for the BitFenix Recon fan controller."
arch=('x86_64')
url="http://phoebetria.com/"
license=('GPL')
depends=('qt4' 'rpmextract' 'systemd-tools' 'libusbx')
makedepends=('gcc')
install="$pkgname.install"
source=(http://downloads.sourceforge.net/project/phoebetria/$pkgname-fc17-$pkgver-0.src.rpm)
sha1sums=('3221dfbda4e15ae1cffdbed3523fb78964df4d4a')


build() {
    cd "$srcdir"
    rpmextract.sh "$pkgname-fc17-$pkgver-0.src.rpm"
    tar xvzf "$pkgname-$pkgver.tar.gz"
    cd "$pkgname-$pkgver"
    # Lowercase the binary name 
    sed -i 's/\(TARGET = \)P\(hoebetria\)/\1p\2/' Phoebetria.pro
    sed -i 's/\(Exec=\)P\(hoebetria\)/\1p\2/' phoebetria.desktop
    qmake-qt4 && make 
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make INSTALL_ROOT="$pkgdir/" install
}

