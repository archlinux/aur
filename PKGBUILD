# Maintainer: Tracktark <zavodsky.richard1 at gmail dot com>

pkgname=umlfri2
pkgver=2.2.2
pkgrel=1
pkgdesc="A flexible DSM modeling tool aimed to help teachers to teach multiple visual modeling languages"
arch=('any')
url="https://umlfri.org"
license=('GPL3')
depends=('python-pyqt5'
         'python-lxml'
         'python-jinja'
         'python-qtconsole'
         'python-appdirs'
         # 'ipython')
         'python-pyparsing')
source=('umlfri::git+https://github.com/umlfri/umlfri2'
        'umlfri.desktop')
sha256sums=('SKIP'
            'df9dca217849fcf4de8d73fe227bf52d0e9f126f863a8413dcf13386939a2f6b')

prepare() {
    cd "$srcdir/umlfri"
    ./tools/icons/download_icons.py
}

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/opt/$pkgname"

    cp -R umlfri/data umlfri/addons umlfri/umlfri2 "$pkgdir/opt/$pkgname"

    mkdir -p "$pkgdir/usr/bin"
    ln -s /opt/umlfri2/main.py "$pkgdir/usr/bin/umlfri2"

    install -Dm755 umlfri/main.py "$pkgdir/opt/$pkgname/main.py"
    install -Dm644 umlfri.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}
