# Maintainer: John Sivak <jsivak@winterjewel.com>
# Previous Maintainer: Joseph Post <joe@jcpst.com>
# Previous Maintainer: Stephan Wienczny <stephan@wienczny.de>

pkgname=dbeaver-ee
pkgver=22.3.0
pkgrel=1
pkgdesc="A universal database tool for developers and database administrators. Enterprise Edition includes NoSQL database support"
arch=('x86_64')
url="http://dbeaver.com/"
license=("Commercial")
depends=('java-runtime>=1.8' 'gtk3' 'gtk-update-icon-cache')
install=dbeaver-ee.install

source=(dbeaver-ee.desktop dbeaver-ee.install)
source_x86_64=(http://dbeaver.com/files/${pkgver}/dbeaver-ee-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz)
sha256sums=('453912912ae8377b16ef74a3e7d93ea588792ee8f7054a573e9fe9b93cd9265f'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_x86_64=('f502b8f15375de072071905740bd1c94ef3a30d91b26a0e28b6959731fcd389a')

noextract=("dbeaver-ee-${pkgver}-linux.gtk.x86_64.tar.gz")

prepare() {
    mkdir -p $srcdir/$pkgname
    cd $srcdir/$pkgname
    if [ "$CARCH" = "x86_64" ]; then
        tar -xf "$srcdir/dbeaver-ee-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz"
    else
        tar -xf "$srcdir/dbeaver-ee-${pkgver}-linux.gtk.x86.tar.gz"
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
    ln -s /opt/${pkgname}/dbeaver usr/bin/dbeaver-ee
    install -m 644 $srcdir/dbeaver-ee.desktop $pkgdir/usr/share/applications/
}
