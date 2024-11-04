# Manteiner: Francesco <chiccocarone@gmail.com>
pkgname=snapcast-gui-git
pkgver=v0.1.0.r19.g9e9bb92
pkgrel=1
pkgdesc="A GUI to control Snapcast"
arch=("x86_64")
url="https://github.com/chicco-carone/Snapcast-Gui"
license=("GPLv3")
depends=("git" "python" "pyside6" "python-setuptools" "python-wheel" "python-platformdirs")
makedepends=("python-notify-py" "python-snapcast")
source=("$pkgname::git+https://github.com/chicco-carone/Snapcast-Gui.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags --exclude last-sip* | sed 's/^wx//;s/\([^-]*-g\)/r\1/;s/-/./g'

}


build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm644 /dev/null "$pkgdir/usr/share/applications/snapcast-gui.desktop"

    cat <<EOF > "$pkgdir/usr/share/applications/snapcast-gui.desktop"
[Desktop Entry]
Name=Snapcast Gui
Comment=A gui to control and manage snapcast
Exec=snapcast-gui
Icon=snapcast-gui
Terminal=false
Type=Application
Categories=AudioVideo;Player;
EOF

    install -Dm644 "$srcdir/$pkgname/icons/Snapcast.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/snapcast-gui.png"
}

provides=("snapcast-gui")
conflicts=("snapcast-gui")
