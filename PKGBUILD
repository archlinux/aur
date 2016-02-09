# Maintainer: Juan Carlos <juancarlospaco@gmail.com>


pkgname=octopussh
pkgver=1.5.0
pkgrel=1
pkgdesc="GUI to make SSH Launchers from .sh Bash Scripts, inspired by KSSH from KDE3."
arch=("any")
url="https://github.com/juancarlospaco/octopussh#octopussh"
license=('GPL')
depends=('python-pyqt5' 'unzip' 'sshpass')
makedepends=('python-distribute')
source=("https://github.com/juancarlospaco/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9f5770361e05364c46245c152bb3208743ff2d8bd0dc0a656441690d2f93bb2e')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    echo -e "\x1b[29;5;7m Building... \x1b[0m"
    python setup.py build
}


package() {
    cd "$srcdir/$pkgname-$pkgver"
    echo -e "\x1b[29;5;7m Installing... \x1b[0m"
    python setup.py install --root="$pkgdir" --optimize=1
    echo "[Desktop Entry]\nExec=chrt --idle 0 octopussh\nName=octopussh\nType=Application" > "$srcdir/octopussh.desktop"
    install -Dm755 "$srcdir/octopussh.desktop" "$pkgdir/usr/share/applications/octopussh.desktop"
}
