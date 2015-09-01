pkgname=unicodemoticon
pkgver=1.2.2
pkgrel=1
pkgdesc="Like a Color Picker but for Unicode Emoticons. Trayicon with Unicode Emoticons using Python3 Qt5."
url="https://github.com/juancarlospaco/unicodemoticon"
depends=('python' 'python-pyqt5')
optdepends=('ttf-symbola: Font with emoji')
makedepends=('python-distribute')
license=('GPL')
arch=('any')
source=("https://pypi.python.org/packages/source/u/$pkgname/$pkgname-$pkgver.zip")
md5sums=('5c211182bc74d3a06a3ab281a5041d36')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build

    python -c 'import unicodemoticon; print(unicodemoticon.AUTOSTART_DESKTOP_FILE)' > unicodemoticon.desktop
}


package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1

    install -Dm755 unicodemoticon.desktop "$pkgdir/usr/share/applications/unicodemoticon.desktop"
}
