# Maintainer: The Arcane Brony <root@thearcanebrony.net>

pkgname=dbeaver-ue
pkgver=21.3.0
pkgrel=1
pkgdesc="A universal database tool for developers and database administrators. Ultimate Edition includes NoSQL and cloud database support."
arch=('x86_64')
url="http://dbeaver.com/"
license=("Commercial")
depends=('java-runtime>=1.8' 'gtk3' 'gtk-update-icon-cache')
install=dbeaver-ue.install

source=(dbeaver-ue.desktop dbeaver-ue.install)
source_x86_64=(https://dbeaver.com/files/${pkgver}/dbeaver-ue-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz)
sha256sums=('da0db9b8344aaf532dabd43c06c3ddd2e2274bf326a1f30f2bf511f2d9aaf837'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_x86_64=('055db52cad75b36af6befdd0280ea4e57fc0aa4085eda45b7cdab3b27cbf1841')

noextract=("dbeaver-ue-${pkgver}-linux.gtk.x86_64.tar.gz")

prepare() {
    mkdir -p $srcdir/$pkgname
    cd $srcdir/$pkgname
    tar -xf "$srcdir/dbeaver-ue-${pkgver}-linux.gtk.x86_64-nojdk.tar.gz"
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
    ln -s /opt/${pkgname}/dbeaver usr/bin/dbeaver-ue
    install -m 644 $srcdir/dbeaver-ue.desktop $pkgdir/usr/share/applications/
}
