# Maintainer: Nenad Stojanovikj <nekk1 at live dot com>
# Previous Maintainer: Joseph Post <joe@jcpst.com>
# Previous Maintainer: Stephan Wienczny <stephan@wienczny.de>

pkgname=dbeaver-ce
pkgver=4.2.4
pkgrel=2
pkgdesc="A free universal database tool for developers and database administrators. This is the community edition."
arch=('i686' 'x86_64')
url="http://dbeaver.jkiss.org/"
license=("GPL")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
install=dbeaver-ce.install

source=(dbeaver-ce.desktop dbeaver-ce.install)
source_i686=(http://dbeaver.jkiss.org/files/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.x86.tar.gz)
source_x86_64=(http://dbeaver.jkiss.org/files/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz)
sha256sums=('d3244943e1698dc1661585a3230f046bb06157e532f44a18ced575bce964746a'
            'a54659b53f1966395f7e296d448c42e1165ec38f5db20181a9e294f775e1c43b')
sha256sums_i686=('c0fd2e93e80d93010a2c40880640132672bc39d2e8e80355b6b49acb7d218e0f')
sha256sums_x86_64=('a1a03606aca830685f313014e03a167e5326a39e71c5245c33d9bcda525f33cf')

noextract=("dbeaver-ce-${pkgver}-linux.gtk.x86.tar.gz"
           "dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz")

prepare() {
    mkdir -p $srcdir/$pkgname
    cd $srcdir/$pkgname
    if [ "$CARCH" = "x86_64" ]; then
        tar -xf "$srcdir/dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz"
    else
        tar -xf "$srcdir/dbeaver-ce-${pkgver}-linux.gtk.x86.tar.gz"
    fi
}

package() {
    cd $pkgdir
    mkdir -p opt/
    mkdir -p usr/bin
    mkdir -p usr/share/applications
    mkdir -p usr/share/icons/hicolor/48x48/apps

    cp -r $srcdir/$pkgname/dbeaver opt/$pkgname
    chmod +x opt/$pkgname/dbeaver
    cp opt/$pkgname/icon.xpm usr/share/icons/hicolor/48x48/apps/${pkgname}.xpm
    ln -s /opt/${pkgname}/dbeaver usr/bin/dbeaver-ce
    install -m 644 $srcdir/dbeaver-ce.desktop $pkgdir/usr/share/applications/
}
