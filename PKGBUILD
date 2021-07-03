# Maintainer: johncena141 <johncena141@protonmail.com>
pkgname='chad_launcher-git'
_pkgname='chad_launcher'
pkgver='r72.3ba752b'
pkgrel=1
pkgdesc='GNU/LINUX GAMING UNLEASHED!'
arch=('x86_64')
url='https://gitlab.com/Gnurur/chad_launcher'
license=('GPL3')
depends=(python python-gobject gtk3)
makedepends=(pkgconf git)
source=('git+https://gitlab.com/Gnurur/chad_launcher.git'
        'chad_launcher.desktop')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python "setup.py" build
}

package() {
    cd "$srcdir/$_pkgname"
    python "setup.py" install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 "$srcdir/$_pkgname/chad_launcher.desktop" "$pkgdir/usr/share/applications/chad_launcher.desktop"
    install -Dm644 "$srcdir/$_pkgname/chad_launcher/data/assets/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
