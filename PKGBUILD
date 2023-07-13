# Maintainer: Petr Kracik <petrkr@petrkr.net>
# Based on dbeaver-ee maintaned by John Sivak <jsivak@winterjewel.com>

pkgname=dbeaver-le
pkgver=23.1.0
pkgrel=1
pkgdesc="A universal database tool for developers and database administrators. Lite Edition"
arch=('x86_64')
url="http://dbeaver.com/"
license=("Commercial")
depends=('java-runtime>=11' 'gtk3' 'gtk-update-icon-cache')
install=dbeaver-le.install

source=(dbeaver-le.desktop dbeaver-le.install)
source_x86_64=(http://dbeaver.com/downloads-lite/${pkgver}/dbeaver-le-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz)
sha256sums=('9d985ebe0332caf09fdee3fbe1e97b4f29533fe84911df46556623dff457a4ee'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_x86_64=('971999779e0addaf00b7e66bda7bd26847efe758bd74c1d69842410c731dd3dd')

noextract=("dbeaver-le-${pkgver}-linux.gtk.x86_64.tar.gz")

prepare() {
    mkdir -p $srcdir/$pkgname
    cd $srcdir/$pkgname
    if [ "$CARCH" = "x86_64" ]; then
        tar -xf "$srcdir/dbeaver-le-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz"
    else
        tar -xf "$srcdir/dbeaver-le-${pkgver}-linux.gtk.x86.tar.gz"
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
    ln -s /opt/${pkgname}/dbeaver usr/bin/dbeaver-le
    install -m 644 $srcdir/dbeaver-le.desktop $pkgdir/usr/share/applications/
}
