# Maintainer: Vitor Rodrigues <vitor.rodrigues@gmail.com>

pkgname=dbeaver-ce-bin
pkgver=21.0.1
pkgrel=1
pkgdesc="Free Universal SQL Client for Developers and Database Administrators (Community Edition)"
arch=('x86_64')
url="http://dbeaver.io/"
license=("Apache")
depends=('java-runtime>=11' 'gtk3' 'gtk-update-icon-cache')
optdepends=('dbeaver-plugin-office: export data in Microsoft Office Excel format'
            'dbeaver-plugin-svg-format: save diagrams in SVG format')
install=dbeaver-ce.install
provides=(dbeaver-ce)
conflicts=(dbeaver-ce)

source=(dbeaver-ce.desktop dbeaver-ce.install)
source_x86_64=(https://dbeaver.io/files/${pkgver}/dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz)
sha256sums=('afb8749c8d73d7feb1227af554de4a1ffff7358f4241db8f6df87063d999ffac'
            '0c2a75baa39459fa56159e982d9f28c966837561bd52dffd24bac87b8d65555f')
sha256sums_x86_64=('5b10843010ea707e38786272adc706c5280ef2f29fbba22c3f66d434bdf813ea')

noextract=("dbeaver-ce-${pkgver}-linux.gtk.x86_64.tar.gz")

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
