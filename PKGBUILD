pkgname=unicodemoticon
pkgver=2.3.4
pkgrel=1
pkgdesc="Like a Color Picker but for Unicode Emoticons. Trayicon with Unicode Emoticons using Python3 Qt5."
url="https://github.com/juancarlospaco/unicodemoticon"
depends=('python' 'python-pyqt5' 'python-anglerfish')
optdepends=('ttf-symbola: Font with emoji')
makedepends=('python-distribute')
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/u/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('97caf0797231077eec7bbb8c58957a63')


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
