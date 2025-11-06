# Maintainer: dmnmsc
pkgname=plocate-gui-git
pkgver=r25.a2e4097
pkgrel=1
pkgdesc="Simple and fast GUI for the plocate file search utility (Git version)"
arch=('any')
url="https://github.com/dmnmsc/plocate-gui"
license=('GPL3')
depends=('python' 'python-pyqt6' 'plocate')
makedepends=('git')
provides=('plocate-gui')
conflicts=('plocate-gui')
source=("$pkgname::git+https://github.com/dmnmsc/plocate-gui.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/plocate-gui-git"

    install -Dm755 plocate-gui.py "${pkgdir}/usr/bin/plocate-gui"

    # If you have an icon (plocate-gui.svg) in the repo, install it as well
    if [[ -f resources/plocate-gui.svg ]]; then
        install -Dm644 resources/plocate-gui.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/plocate-gui.svg"
    fi

    # If you have a desktop entry (plocate-gui.desktop) in the repo, install it
    if [[ -f resources/plocate-gui.desktop ]]; then
        install -Dm644 resources/plocate-gui.desktop "${pkgdir}/usr/share/applications/plocate-gui.desktop"
    fi

    # Documentation
    if [[ -f README.md ]]; then
        install -Dm644 README.md "${pkgdir}/usr/share/doc/plocate-gui/README.md"
    fi
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
