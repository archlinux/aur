# Maintainer: Code of Honor https://gitlab.com/ttrpgsuite/alpha/support/-/issues/new
pkgname=ttrpgsuite
pkgver=0.0.1.0
pkgrel=1
pkgdesc="An all-in-one toolkit for tabletop RPGs"
arch=('any')
url="https://gitlab.com/ttrpgsuite/alpha/release"
license=('BSD 4-Clause' 'Commons-Clause')
depends=('python' 'python-colorama' 'rsync')
makedepends=('python-setuptools')
source=('git+https://gitlab.com/ttrpgsuite/alpha/release.git') # 'post-install.sh')
sha256sums=('SKIP')

#prepare() {
#    cd "$srcdir/release"
#}

# FOR USE WITH SETUP.PY
#build() {
#    cd "$srcdir/release"
#    python setup.py build
#}

package() {
    cd "$srcdir/release"

    # FOR USE WITH SETUP.PY
    # Install the application system-wide from the build directory
    #python setup.py install --root="$pkgdir" --optimize=1

    # FOR USE WITHOUT SETUP.PY
    # Install the application system-wide temporarily (e.g., /usr/share/ttrpgsuite/)
    install -d "$pkgdir/usr/share/ttrpgsuite"
    cp -r LICENSE.md README.md __init__.py themes.py ui.py ttrpglauncher.py themepicker.py diceroller.py charcreator.py characters series uninstall.sh "$pkgdir/usr/share/ttrpgsuite/"

    # Install the desktop file and icon for system-wide access
    install -Dm644 "ttrpgsuite.desktop" "$pkgdir/usr/share/applications/ttrpgsuite.desktop"
    install -Dm644 "ttrpgsuite_icon.png" "$pkgdir/usr/share/pixmaps/ttrpgsuite_icon.png"

    # Add post-install script to copy files to ~/Games/TTRPGSuite/ and handle symlinks ONLY IF RUNNING REMOTELY FROM REPO DOES NOT WORK
    install -Dm755 "post-install.sh" "$pkgdir/usr/share/ttrpgsuite/post-install.sh"
}

