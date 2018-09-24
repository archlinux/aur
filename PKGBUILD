# Maintainer: Denys Vitali <denys@denv.it>
# Based on the work of (dbeaver-ee):
# * John Sivak <jsivak@winterjewel.com>
# * Joseph Post <joe@jcpst.com>
# * Stephan Wienczny <stephan@wienczny.de>

pkgname=dbeaver-ce
pkgver=5.2.1
pkgrel=1
pkgdesc="An universal database tool for developers and database administrators. Community Edition"
arch=('i686' 'x86_64')
url="https://github.com/dbeaver/dbeaver"
license=("GPL")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
install=dbeaver-ce.install

source=(dbeaver-ce.desktop dbeaver-ce.install)
source_i686=("https://dbeaver.jkiss.org/files/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.x86.tar.gz"
             "https://dbeaver.io/files/${pkgver}/checksum/dbeaver-ce-${pkgver}-linux.gtk.x86.tar.gz.sha256")
source_x86_64=("https://dbeaver.jkiss.org/files/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz"
             "https://dbeaver.io/files/${pkgver}/checksum/dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz.sha256")
sha256sums=('f1dd2cd13732d00a36d95218d59423689112b343b2212744f6c7b6893381ce78'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_i686=('SKIP' 'SKIP')
sha256sums_x86_64=('SKIP' 'SKIP')

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

