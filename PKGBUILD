# Maintainer: Denys Vitali <denys@denv.it>
# Based on the work of (dbeaver-ee):
# * John Sivak <jsivak@winterjewel.com>
# * Joseph Post <joe@jcpst.com>
# * Stephan Wienczny <stephan@wienczny.de>

pkgname=dbeaver-ce
pkgver=4.3.5
pkgrel=1
pkgdesc="A universal database tool for developers and database administrators. Enterprise Edition includes NoSQL database support"
arch=('i686' 'x86_64')
url="http://dbeaver.com/"
license=("GPL")
depends=('java-runtime>=1.6' 'gtk2' 'gtk-update-icon-cache')
install=dbeaver-ce.install

source=(dbeaver-ce.desktop dbeaver-ce.install)
source_i686=(https://dbeaver.jkiss.org/files/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.x86.tar.gz)
source_x86_64=(https://dbeaver.jkiss.org/files/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz)
sha256sums=('f1dd2cd13732d00a36d95218d59423689112b343b2212744f6c7b6893381ce78'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_i686=('f5c9b473732a8d8633eebcb81dc8735d190af6e56ce939bcf2eab6ce8b2c473a')
sha256sums_x86_64=('c1a3f08c34de8cea8076acc1b2709860bacd9b2861d006f81efa33fbdbde47b6')

# https://dbeaver.jkiss.org/files/${pkgver}/checksum/dbeaver-ce-${pkgver}-linux.gtk.x86.tar.gz.sha256
# https://dbeaver.jkiss.org/files/${pkgver}/checksum/dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz.sha256

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

