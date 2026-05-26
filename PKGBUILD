# Maintainer: Ammar Rexhaj <ammarrexhaj@gmail.com>
pkgname=controller-manager
pkgver=0.1.0
pkgrel=1
pkgdesc="GUI for viewing connected game controllers and testing inputs on Linux"
arch=('any')
url="https://github.com/bandyburrito/ControllerManagerArch"
_reponame=ControllerManagerArch
license=('MIT')
depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-evdev'
    'python-pyudev'
)
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('56a96e4b5de8203007fd2eda01746c4b3d287017f2dcc240f7181e36de7e2cc6')

package() {
    cd "$srcdir/$_reponame-$pkgver"

    # Install application files
    install -d "$pkgdir/usr/share/$pkgname"
    install -m644 main.py backend.py widgets.py tester.py window.py \
        "$pkgdir/usr/share/$pkgname/"

    # Launcher script
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
exec python /usr/share/$pkgname/main.py "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    install -Dm644 "$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # License + README
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
